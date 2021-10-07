package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.service.CartSerice;
import shoppingcart.service.CategoryService;
import shoppingcart.service.ProductService;

import java.util.ArrayList;
import java.util.List;
@Transactional
@RestController
@RequestMapping("/api/admin")
public class AdminControllerApi {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping("/showProduct")
    public ResponseEntity<Iterable<Product>> findAllProduct() {
        List<Product> products = (List<Product>) productService.findAll();
        if (products.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @PostMapping("/addProduct")
    public ResponseEntity<?> addProduct(@RequestParam(name = "name") String name,
                                        @RequestParam(name = "price") Long price,
                                        @RequestParam(name = "img") MultipartFile multipartFile,
                                        @RequestParam(name = "rateAverage") Double rateAverage,
                                        @RequestParam(name = "category") List<Integer> categoryIds) {
        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setRateAverage(rateAverage);

        List<Category> categoryList = new ArrayList<>();
        for (Integer cateId : categoryIds) {
            Category category = categoryService.findById(cateId).get();
            categoryList.add(category);
            System.out.println(cateId);
        }
        productService.save(product, multipartFile);
        for (Category category : categoryList) {
            category.getProductList().add(product);
            categoryRepository.save(category);
        }
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @PutMapping("/updateProduct")
    public ResponseEntity<?> updateProduct(@RequestParam(name = "productId") Integer productId,
                                           @RequestParam(name = "name") String name,
                                           @RequestParam(name = "price") Long price,
                                           @RequestParam(name = "img") MultipartFile multipartFile,
                                           @RequestParam(name = "rateAverage") Double rateAverage,
                                           @RequestParam(name = "category", required = false) List<Integer> categoryIds) {

        System.out.println(name);
        System.out.println(price);
        System.out.println(rateAverage);
        Product product = new Product();
        product.setId(productId);
        product.setName(name);
        product.setPrice(price);
        product.setRateAverage(rateAverage);

        List<Category> categoryList = new ArrayList<>(); // nguoi dung nhap tu jsp
        if (categoryIds != null) {
            for (Integer cateId : categoryIds) {
                Category category = categoryService.findById(cateId).get();
                categoryList.add(category);
                System.out.println(cateId);
            }
        }
        List<Category> oldList = productService.findById(product.getId()).get().getCategory(); // list category lay tu db theo findById
        productService.updateProduct(product, multipartFile);
        for (Category category : oldList) {
            {
                List<Product>  productList = category.getProductList();
                productList.removeIf(p -> p.getId() == product.getId());
                category.setProductList(productList);
                categoryRepository.save(category);
            }
        }
        for (Category category : categoryList) {
            category.getProductList().add(product); // neu co roi thi khong lam gi , neu chua co thi them vao cate
            categoryRepository.save(category);
        }
        return new ResponseEntity<>(product, HttpStatus.OK);
    }



}
