package shoppingcart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.Category;
import shoppingcart.entity.User;
import shoppingcart.service.CategoryService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/getAll")
    public ModelAndView getAllCategory() {
        ModelAndView mav = new ModelAndView("admin/category/listCategory");
        Iterable<Category> listCategory = categoryService.findAll();
        mav.addObject("listCategory", listCategory);
        return mav;
    }

    @GetMapping("/addCategory")
    public ModelAndView initAddCategory() {
        ModelAndView mav = new ModelAndView("admin/category/creat");
        Category category = new Category();
        mav.addObject("category", category);
        return mav;
    }

    @PostMapping("/addCategory")
    public String addCategory(Category category) {
        categoryService.save(category);
        return "redirect:getAll";
    }

    @GetMapping("/updateCategory")
    public ModelAndView initUpdateCategory(@RequestParam(name = "id") Integer id) {
        ModelAndView mav = new ModelAndView("admin/category/update");
        Optional<Category> categoryUpdate = categoryService.findById(id);
        mav.addObject("categoryUpdate",categoryUpdate);
        return mav;
    }

    @PostMapping("/updateCategory")
    public String updateCategory(@ModelAttribute(name = "updateCategory") Category updateCategory) {
        Category category = categoryService.updateCategory(updateCategory.getId(),updateCategory);
        return "redirect:getAll";
    }

    @GetMapping("/deleteCategory")
    public String deleteCategory(Integer id){
        categoryService.remove(id);
        return "redirect:getAll";
    }

}
