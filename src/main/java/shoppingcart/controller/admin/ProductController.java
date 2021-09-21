package shoppingcart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.CategoryService;
import shoppingcart.service.ProductService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/products")
@Transactional
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping("/getAll")
    public ModelAndView getAllCategory() {
        ModelAndView mav = new ModelAndView("admin/product/show");
        Iterable<Product> listProduct = productService.findAll();
        Iterable<Category> listCategory = categoryService.findAll();
        mav.addObject("listCategory", listCategory);
        mav.addObject("listProduct", listProduct);
        return mav;
    }


    @GetMapping("/addProduct")
    public ModelAndView initAddProduct() {
        ModelAndView mav = new ModelAndView("admin/product/creat");
        Product product = new Product();
        Iterable<Category> listCategory = categoryService.findAll();
        mav.addObject("listCategory", listCategory);
        mav.addObject("product", product);
        return mav;
    }

    @PostMapping("/addProduct")
    public String addProduct(@Valid Product product, BindingResult bindingResult,
                             @RequestParam(name = "img") MultipartFile multipartFile,
                             @RequestParam(name = "category") List<Integer> categoryIds,
                             Model model) {
        if (bindingResult.hasErrors()) {
            Iterable<Category> listCategory = categoryService.findAll();
            model.addAttribute("listCategory", listCategory);
            return "admin/product/creat";
        }
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
        return "redirect:/admin/products/getAll";
    }

    @GetMapping("/updateProduct")
    public ModelAndView initUpdateProduct(@RequestParam(name = "id") Integer id) {
        ModelAndView mav = new ModelAndView("admin/product/update");
        Optional<Product> productUpdate = productService.findById(id);
        Iterable<Category> listCategory = categoryService.findAll();
        mav.addObject("productUpdate", productUpdate.get());
        mav.addObject("listCategory", listCategory);
        return mav;
    }

    @PostMapping("/updateProduct")
    public String updateProduct(Product product,
                                @RequestParam(name = "img") MultipartFile multipartFile,
                                @RequestParam(name = "category",required = false) List<Integer> categoryIds) {
//        System.out.println(multipartFile.getOriginalFilename());
//        System.out.println(product.getImage());
        List<Category> categoryList = new ArrayList<>(); // nguoi dung nhap tu jsp
        for (Integer cateId : categoryIds) {
            Category category = categoryService.findById(cateId).get();
            categoryList.add(category);
            System.out.println(cateId);
        }
        List<Category> oldList = productService.findById(product.getId()).get().getCategory(); // list category lay tu db theo findById
        productService.updateProduct(product, multipartFile);
        for (Category category : categoryList) {
            boolean check = categoryService.prepareArray(category, oldList); // so sanh thang cu voi thang moi
            if (check ) { // check thang cu voi thang moi
                category.getProductList().add(product); // neu co roi thi khong lam gi , neu chua co thi them vao cate
                categoryRepository.save(category);
            }
        }

        return "redirect:/admin/products/getAll";
    }


    @GetMapping("/deleteProduct")
    public String deleteProduct(Integer id) {
        productService.remove(id);
        return "redirect:/admin/products/getAll";
    }
}
