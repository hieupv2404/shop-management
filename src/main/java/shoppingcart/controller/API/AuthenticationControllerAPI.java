package shoppingcart.controller.API;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.controller.AuthenticationController;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;
import shoppingcart.security.EncryptMD5;
import shoppingcart.service.EmailService;

import javax.mail.MessagingException;
import javax.validation.Valid;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Random;

@RestController
@RequestMapping("/auth/API")
public class AuthenticationControllerAPI {
    @Autowired
    UserRepository userRepository;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private EmailService emailService;


    @PostMapping("/login")
    public ResponseEntity<?> login(
            @ModelAttribute("userSignIn") User user) {
        User userReal = userRepository.findByUsername(user.getUsername());
        if (userReal != null) {
            if (!user.getPassword().equals(userReal.getPassword())) {
                return new ResponseEntity<>("wrong password", HttpStatus.valueOf(200));
            }
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userReal.getUsername(), userReal.getPassword()));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return new ResponseEntity<>(HttpStatus.valueOf(200));
        } else {
            return new ResponseEntity<>("wrong userId", HttpStatus.valueOf(400));
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody User input, BindingResult bindingResult) {
            if (bindingResult.hasErrors()) {
                return new ResponseEntity<>("user invalid", HttpStatus.BAD_REQUEST);
            }
            if (userRepository.findByUsername(input.getUsername()) == null) {
                if (userRepository.findByEmail(input.getEmail()) != null) {
                    return new ResponseEntity<>("email exist", HttpStatus.BAD_REQUEST);
                }
                String newPassword = AuthenticationController.randomPassword(10);
                Map<String, Object> map = new ModelMap();
                map.put("key", newPassword);
                input.setPassword(newPassword);
                try {
                    emailService.sendMessageUsingThymeleafTemplate(input.getEmail(), "welcome my shop", map);
                } catch (MessagingException e) {
                    e.printStackTrace();
                    return new ResponseEntity<>(null,
                            HttpStatus.BAD_REQUEST);
                }
                userRepository.save(input);
                return new ResponseEntity<>(null,
                        HttpStatus.valueOf(201));
            }
        return new ResponseEntity<>("username invalid", HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(){
        SecurityContextHolder.clearContext();
        return new ResponseEntity<>(HttpStatus.valueOf(200));
    }

    @ExceptionHandler(MessagingException.class)
    public ResponseEntity<?> handleException(MessagingException ex) {
        //Do something additional if required
        return new ResponseEntity<>("Send mail fail by internal server", HttpStatus.valueOf(500));
    }
}

