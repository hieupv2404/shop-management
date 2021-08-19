package shoppingcart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import shoppingcart.entity.User;

@Controller
public class WebController {

    @GetMapping("")
    public String getHome(ModelMap modelMap){
        modelMap.addAttribute("user",new User());
        modelMap.addAttribute("hello","1234");
        return "hello";
    }

    @GetMapping("/signUp")
    public String getSignUp(){return "signUp";}
}
