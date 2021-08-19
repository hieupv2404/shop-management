package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.User;
import shoppingcart.service.UserService;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/user")
public class WebUserController {

    @Autowired
    private UserService userService;


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
    public String updateUserProfile(@ModelAttribute(name = "userUpdate") User userUpdate, @RequestParam(name = "sex") Boolean sex) {
        System.out.println(userUpdate.getBirthday());
        userUpdate.setSex(sex);
        User user = userService.updateUser(userUpdate.getId(), userUpdate);
        return "redirect:getAll.htm";
    }

//    @RequestMapping(value = "/initChangePassword.htm")
//    public ModelAndView initChangePassword(@RequestParam(name = "id") Integer id) {
//        ModelAndView mav = new ModelAndView("changePassword");
//        Optional<User> userChangePassword = userService.findById(id);
//        mav.addObject("userChangePassword", userChangePassword);
//        return mav;
//    }

//    @RequestMapping(value = "/changePassword.htm", method = RequestMethod.POST)
//    public String changePassword(@ModelAttribute User updateProfile) {
//        User user = userService.updateUser(updateProfile.getId(),updateProfile);
//        System.out.println(user.getId());
//        return "redirect:getAll.htm"";
//    }


    @RequestMapping(value = "/initShowUser.htm", method = RequestMethod.GET) //
    public ModelAndView showProduct(int id) {
        ModelAndView mav = new ModelAndView("showUser");
        Optional<User> showUser = userService.findById(id);
        mav.addObject("showUser", showUser);
        return mav;
    }


}
