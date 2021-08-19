package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;
import shoppingcart.service.EmailService;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Random;

@Controller
@ControllerAdvice
@RequestMapping("/auth")
public class AuthenticationController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private EmailService emailService;

    public static String randomPassword(Integer length) {
        int leftLimit = 97; // letter 'a'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = length;
        Random random = new Random();
        StringBuilder buffer = new StringBuilder(targetStringLength);
        for (int i = 0; i < targetStringLength; i++) {
            int randomLimitedInt = leftLimit + (int)
                    (random.nextFloat() * (rightLimit - leftLimit + 1));
            buffer.append((char) randomLimitedInt);
        }
        String generatedString = buffer.toString();
        return generatedString;
    }

    @PostMapping("/register")
    public String postRegister(@Valid @ModelAttribute("user") User input, BindingResult bindingResult, ModelMap modelMap, HttpSession httpSession) throws MessagingException {
        if (bindingResult.hasFieldErrors("username")) {
            return "home";
        }
        if (userRepository.findByUsername(input.getUsername()) == null) {
            //userRepository.save(input);
            Map<String, Object> map = new ModelMap();
            map.put("key", randomPassword(10));
            emailService.sendMessageUsingThymeleafTemplate(input.getEmail(), "welcome my shop", map);
            httpSession.setAttribute("signUpSuccess", "true");
            return "redirect:/";
        }
        modelMap.addAttribute("errorUser", "username is exist");
        return "home";
    }

    @ExceptionHandler(MessagingException.class)
    public ModelAndView handleException(MessagingException ex) {
        //Do something additional if required
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("errorPage");
        modelAndView.addObject("message", ex.getMessage());
        return modelAndView;
    }
}
