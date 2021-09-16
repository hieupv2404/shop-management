package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/get/dashboard")
    public String getAdminPage(HttpServletRequest httpServletRequest, HttpSession httpSession) {
        httpSession.setAttribute("id", httpServletRequest.getSession().getId());
        return "admin/home";
    }

    @GetMapping("/get/chat")
    public String getChatApp() {
        return "admin/chat";
    }
}
