package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    @GetMapping("/get/chatBox")
    public String getChatApp(HttpServletRequest httpServletRequest) {
        return "admin/chatBox";
    }

    @GetMapping("/get/chat")
    public String getChat(@RequestParam String id, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        return "admin/chat";
    }

    @GetMapping("/get/users")
    public String getUsers(ModelMap modelMap) {
        modelMap.addAttribute("users", userRepository.findAllByAdminFalse());
        return "admin/showUsers";
    }

    @GetMapping("/get/details/user")
    public String getDetailsUser(ModelMap modelMap, @RequestParam Integer id) {
        modelMap.addAttribute("user", userRepository.findById(id).get());
        return "admin/detailsUser";
    }

    @GetMapping("/put/block/user")
    public String putBlockUser(ModelMap modelMap, @RequestParam Integer id) {
        if (userRepository.findById(id).isPresent()) {
            User user = userRepository.findById(id).get();
            user.setBlock(true);
            userRepository.save(user);
            modelMap.addAttribute("user", user);
        }
        return "redirect:/admin/get/details/user?id="+id;
    }

    @GetMapping("/put/unblock/user")
    public String putUnblockUser(ModelMap modelMap, @RequestParam Integer id) {
        if (userRepository.findById(id).isPresent()) {
            User user = userRepository.findById(id).get();
            user.setBlock(false);
            userRepository.save(user);
            modelMap.addAttribute("user", user);
        }
        return "redirect:/admin/get/details/user?id="+id;
    }
}
