package shoppingcart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Controller
public class WebController {
    @Autowired
    public ProductServiceImpl productServiceImpl;
    @GetMapping("")
    public String getHome(ModelMap modelMap, HttpSession httpSession){
        if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser"))
        {
            modelMap.addAttribute("name",SecurityContextHolder.getContext().getAuthentication().getName());
            if (httpSession.getAttribute("userId")!=null){
                modelMap.addAttribute("userId",httpSession.getAttribute("userId"));
            }
            return "homeAfterSignIn";
        }
        modelMap.addAttribute("user",new User());
        modelMap.addAttribute("userSignIn", new User());
        if (httpSession.getAttribute("againUser")!=null){
            modelMap.addAttribute("againUser",httpSession.getAttribute("againUser"));
        }
        if (httpSession.getAttribute("errorSignIn")!=null){
            modelMap.addAttribute("errorSignIn",httpSession.getAttribute("errorSignIn"));
        }
        if (httpSession.getAttribute("errorUsername")!=null){
            modelMap.addAttribute("errorUsername",httpSession.getAttribute("errorUsername"));
        }
        if (httpSession.getAttribute("errorEmail")!=null){
            modelMap.addAttribute("errorEmail",httpSession.getAttribute("errorEmail"));
        }
        if (httpSession.getAttribute("errorPhone")!=null){
            modelMap.addAttribute("errorPhone",httpSession.getAttribute("errorPhone"));
        }
        if (httpSession.getAttribute("existUsername")!=null){
            modelMap.addAttribute("existUsername",httpSession.getAttribute("existUsername"));
        }
        if (httpSession.getAttribute("existEmail")!=null){
            modelMap.addAttribute("existEmail",httpSession.getAttribute("existEmail"));
        }
        //list men length 8
        Iterable<Product> menProduct = productServiceImpl.getProductsByCategoryId(3);
        Iterable<Product> womenProduct = productServiceImpl.getProductsByCategoryId(4);
        Iterable<Product> bagProduct = productServiceImpl.getProductsByCategoryId(5);
        Iterable<Product> footwearProduct = productServiceImpl.getProductsByCategoryId(6);
        modelMap.addAttribute("menProduct",menProduct);
        modelMap.addAttribute("womenProduct", womenProduct);
        modelMap.addAttribute("bagProduct",bagProduct);
        modelMap.addAttribute("footwearProduct",footwearProduct);
        return "home";
    }

    @GetMapping("/errorPage")
    public String getErrorPage(ModelMap modelMap){

        modelMap.addAttribute("errorName","send mail fail by internal server");
        return "errorPage";
    }
}
