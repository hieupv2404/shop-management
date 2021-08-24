package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.DTO.ChangePasswordDto;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.security.EncryptMD5;
import shoppingcart.service.ProductService;
import shoppingcart.service.UserService;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping(value = "/user")
public class WebUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;


    @GetMapping(value = "/getAll.htm")
    public ModelAndView getAllUser() {
        ModelAndView mav = new ModelAndView("show");
        Iterable<User> userIterable = userService.findAll();
        mav.addObject("userIterable", userIterable);
        return mav;
    }


    @RequestMapping(value = "/initUpdateProfile.htm")
    public ModelAndView initUpdateProfile(@RequestParam(name = "id") Integer id) {
        ModelAndView mav = new ModelAndView("updateProfile");
        Optional<User> userUpdate = userService.findById(id);
        mav.addObject("userUpdate", userUpdate.get());
        return mav;
    }

    @RequestMapping(value = "/updateUser.htm", method = RequestMethod.POST)
    public String updateUserProfile(@Valid @ModelAttribute(name = "userUpdate") User userUpdate,
                                    BindingResult bindingResult,
                                    @RequestParam(name = "sex") Boolean sex) {
        if (bindingResult.hasErrors()) {
            return "updateProfile";
        }
        System.out.println(bindingResult.hasErrors());
        System.out.println(userUpdate.getBirthday());
        userUpdate.setSex(sex);
        User user = userService.updateUser(userUpdate.getId(), userUpdate);
        return "redirect:getAll.htm";
    }

    @RequestMapping(value = "/initChangePassword.htm")
    public ModelAndView initChangePassword(@RequestParam(name = "id") Integer id,
                                           @RequestParam(name = "messages", required = false) String messages) {
        ModelAndView mav = new ModelAndView("changePassword");
        Optional<User> userChangePassword = userService.findById(id);
        mav.addObject("userChangePassword", userChangePassword.get());
        mav.addObject("message",messages);
        return mav;
    }

    @RequestMapping(value = "/changePassword.htm", method = RequestMethod.POST)
    public String changePassword(@RequestParam(name = "id") Integer id,
                                 @RequestParam(name = "currentPass") String oldPassword,
                                 @RequestParam(name = "newPass") String password) {
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


    @RequestMapping(value = "/initShowUser.htm", method = RequestMethod.GET)
    public ModelAndView showProduct(int id) {
        ModelAndView mav = new ModelAndView("showUser");
        Optional<User> showUser = userService.findById(id);
        mav.addObject("showUser", showUser);
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
