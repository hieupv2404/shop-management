package shoppingcart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.CategoryService;
import shoppingcart.service.ProductService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/products")
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
    public String addProduct(Product product, @RequestParam(name = "category") List<Integer> categoryIds) {
        List<Category> categoryList = new ArrayList<>();
        for (Integer cateId : categoryIds) {
            Category category = categoryService.findById(cateId).get();
            categoryList.add(category);
        }
        //option 1:
        productRepository.save(product);
        Product product1 = productRepository.findByName(product.getName());
        product1.setCategory(categoryList);
        productRepository.save(product1);
//        option 2:
//        for (Category category : categoryList) {
//            category.getProductList().add(product);
//            categoryRepository.save(category);
//        }

        return "redirect:getAll";
    }


    @GetMapping("/deleteProduct")
    public String deleteProduct(Integer id) {
        productService.remove(id);
        return "redirect:/admin/products/getAll";
    }
}
