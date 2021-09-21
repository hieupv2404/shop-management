package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import shoppingcart.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserRepository userRepository;
public static String adminSession;
    @GetMapping("/get/dashboard")
    public String getAdminPage(HttpServletRequest httpServletRequest, HttpSession httpSession) {
        httpSession.setAttribute("id", httpServletRequest.getSession().getId());
        return "admin/home";
    }

    @GetMapping("/get/chatBox")
    public String getChatApp(HttpServletRequest httpServletRequest) {
        adminSession= httpServletRequest.getSession().getId();
        return "admin/chatBox";
    }

    @GetMapping("/get/chat")
    public String getChat(@RequestParam String id, ModelMap modelMap) {
        modelMap.addAttribute("id",id);
        return "admin/chat";
    }
}
