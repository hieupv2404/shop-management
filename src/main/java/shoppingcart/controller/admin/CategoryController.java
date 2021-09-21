package shoppingcart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.Category;
import shoppingcart.entity.User;
import shoppingcart.service.CategoryService;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/getAll")
    public ModelAndView getAllCategory() {
        ModelAndView mav = new ModelAndView("admin/category/show");
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
    public String addCategory(@Valid Category category, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/category/creat";
        }
        categoryService.save(category);
        return "redirect:getAll";
    }

    @GetMapping("/updateCategory")
    public ModelAndView initUpdateCategory(@RequestParam(name = "id") Integer id) {
        ModelAndView mav = new ModelAndView("admin/category/update");
        Optional<Category> categoryUpdate = categoryService.findById(id);
        mav.addObject("categoryUpdate",categoryUpdate.get());
        return mav;
    }

    @PostMapping("/updateCategoryPost")
    public String updateCategory(Category category) {
        System.out.println(category.getId());
        categoryService.save(category);
        return "redirect:getAll";
    }



    @GetMapping("/deleteCategory")
    public String deleteCategory(Integer id){
        categoryService.remove(id);
        return "redirect:/admin/categories/getAll";
    }

}
