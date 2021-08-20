package shoppingcart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/user")
public class UserController {

    @GetMapping("/userProfile")
    public String getuserProfile(Principal principal, ModelMap modelMap){
        modelMap.addAttribute("userName",principal.getName());
        return "infoUser";
    }
}
