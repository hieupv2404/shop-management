package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.DTO.ChangePasswordDto;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.security.EncryptMD5;
import shoppingcart.repository.UserRepository;
import shoppingcart.service.ProductService;
import shoppingcart.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Optional;

@Controller
@RequestMapping(value = "/user")
public class WebUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private  UserRepository userRepository;

    private boolean checkAccessRightUserById(Integer id, Principal principal) {
        User user=userRepository.findById(id).isPresent()?userRepository.findById(id).get():null;
        if (user!=null){
            return user.getUsername().equals(principal.getName());
        }
        return false;
    }


    @GetMapping(value = "/getAll.htm")
    public ModelAndView getAllUser() {
        ModelAndView mav = new ModelAndView("show");
        Iterable<User> userIterable = userService.findAll();
        mav.addObject("userIterable", userIterable);
        return mav;
    }


    @RequestMapping(value = "update/profile.htm", method = RequestMethod.GET)
    public ModelAndView initUpdateProfile(@RequestParam(name = "id") Integer id,Principal principal) {
        if (!checkAccessRightUserById(id, principal)){
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("errorName","your access is denied");
            return mav;
        }
        ModelAndView mav = new ModelAndView("updateProfile");
        Optional<User> userUpdate = userService.findById(id);
        mav.addObject("userUpdate", userUpdate.get());
        return mav;
    }

    @RequestMapping(value = "update/profile.htm", method = RequestMethod.POST)
    public String updateUserProfile(@Valid @ModelAttribute(name = "userUpdate") User userUpdate,
                                    BindingResult bindingResult,
                                    @RequestParam(name = "sex") Boolean sex, Principal principal, ModelMap modelMap) {
        if (bindingResult.hasErrors()) {
            if (bindingResult.hasFieldErrors("birthday"))
                modelMap.addAttribute("errorBirthday","Date format invalid");
            return "updateProfile";
        }
        if (!checkAccessRightUserById(userUpdate.getId(), principal)){
            modelMap.addAttribute("errorName","your access is denied");
            return "errorPage";
        }
        userUpdate.setSex(sex);
        User user = userService.updateUser(userUpdate.getId(), userUpdate);
        return "redirect:/user/show/profile" + "?id=" + userUpdate.getId();
    }

    @RequestMapping(value = "/change/password.htm", method = RequestMethod.GET)
    public ModelAndView initChangePassword(@RequestParam(name = "id") Integer id,
                                            @RequestParam(name = "messages", required = false) String messages, Principal principal) {
        if (!checkAccessRightUserById(id, principal)){
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("errorName","your access is denied");
            return mav;
        }
        ModelAndView mav = new ModelAndView("changePassword");
        Optional<User> userChangePassword = userService.findById(id);
        mav.addObject("userChangePassword", userChangePassword.get());
        mav.addObject("message",messages);
        return mav;
    }

    @RequestMapping(value = "/change/password.htm", method = RequestMethod.POST)
    public String changePassword(@RequestParam(name = "id") Integer id,
                                 @RequestParam(name = "currentPass") String oldPassword,
                                 @RequestParam(name = "newPass") String password,
                                 @RequestParam(name = "confirmPass") String confirmPassword, Principal principal, ModelMap modelMap) {
        if (!checkAccessRightUserById(id, principal)){
            modelMap.addAttribute("errorName","your access is denied");
            return "errorPage";
        }
        ChangePasswordDto changePasswordDto = new ChangePasswordDto();
        changePasswordDto.setId(id);
        changePasswordDto.setOldPassword(oldPassword);
        changePasswordDto.setPassword(password);
        User user = userService.updatePassword(changePasswordDto);
        if (user == null) {
            String messages = "loi roi";
            return "redirect:/user/initChangePassword.htm?id=" + id + "&messages="+messages;
        } else {
            return "redirect:/user/getAll.htm";
        }
    }


    @RequestMapping(value = "/show/profile", method = RequestMethod.GET)
    public ModelAndView showProduct(int id, Principal principal) {
        if (!checkAccessRightUserById(id, principal)){
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("errorName","your access is denied");
            return mav;
        }
        ModelAndView mav = new ModelAndView("showUser");
        Optional<User> showUser = userService.findById(id);
        mav.addObject("showUser", showUser);
        mav.addObject("userId", id);
        return mav;
    }

    @GetMapping(value = "/initShowProduct.htm")
    public ModelAndView showProduct() {
        ModelAndView mav = new ModelAndView("showProduct");
        Iterable<Product> productIterable = productService.findAll();
        mav.addObject("productIterable", productIterable);
        return mav;
    }
}
