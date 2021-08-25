package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;
import shoppingcart.security.EncryptMD5;
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
        if (bindingResult.hasErrors()) {
            httpSession.setAttribute("errorSignUp", "true");
            httpSession.setAttribute("againUser", input);
            if (bindingResult.hasFieldErrors("username"))
                httpSession.setAttribute("errorUsername", "username invalid");
            if (bindingResult.hasFieldErrors("email"))
                httpSession.setAttribute("errorEmail", "email invalid");
            if (bindingResult.hasFieldErrors("phone"))
                httpSession.setAttribute("errorPhone", "phone invalid");
            return "redirect:/";
        }
        if (userRepository.findByUsername(input.getUsername()) == null) {
            if (userRepository.findByEmail(input.getEmail()) != null) {
                httpSession.setAttribute("errorSignUp", "true");
                httpSession.setAttribute("againUser", input);
                httpSession.setAttribute("existEmail", "email is exist");
            }
            Map<String, Object> map = new ModelMap();
            String newPassword = randomPassword(10);
            map.put("key", newPassword);
            input.setPassword(newPassword);
            System.out.println(EncryptMD5.EncryptedToMD5(newPassword));
            userRepository.save(input);
            emailService.sendMessageUsingThymeleafTemplate(input.getEmail(), "welcome my shop", map);
            httpSession.setAttribute("signUpSuccess", "true");
            return "redirect:/";
        }
        httpSession.setAttribute("errorSignUp", "true");
        httpSession.setAttribute("againUser", input);
        httpSession.setAttribute("existUsername", "username is exist");
        return "redirect:/";
    }

    @PostMapping("/signIn")
    public String postSignIn(@ModelAttribute("userSignIn") User user, ModelMap modelMap, HttpSession httpSession) {
        User userReal = userRepository.findByUsername(user.getUsername());
        if (userReal != null) {
            if (user.getPassword().equals(userReal.getPassword())) {
                Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                httpSession.setAttribute("userId",userReal.getId());
                return "redirect:/";
            }
        }
        httpSession.setAttribute("errorSignIn", "wrong password or username");
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String postLogout() {
        SecurityContextHolder.clearContext();
        return "redirect:/";
    }

    @ExceptionHandler(MessagingException.class)
    public ModelAndView handleException(MessagingException ex) {
        //Do something additional if required
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("errorPage");
        modelAndView.addObject("errorPre","5");
        modelAndView.addObject("errorMed","0");
        modelAndView.addObject("errorSuf","0");
        modelAndView.addObject("message", ex.getMessage());
        modelAndView.addObject("errorName", "Send mail fail by internal server");
        return modelAndView;
    }
}
