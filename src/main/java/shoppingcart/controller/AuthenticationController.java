package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;
import shoppingcart.security.EncryptMD5;
import shoppingcart.service.EmailService;

@RestController
@RequestMapping("/auth")
public class AuthenticationController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private EmailService emailService;


    @PostMapping("/login")
    public ResponseEntity<?> login(
            @RequestParam(value = "username", defaultValue = "") String username,
            @RequestParam(value = "password", defaultValue = "") String password) {
        User user = userRepository.findByUsername(username);
        if (user != null) {
            if (!EncryptMD5.EncryptedToMD5(password).equals(user.getPassword())) {
                return new ResponseEntity<>("wrong password", HttpStatus.valueOf(200));
            }
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, EncryptMD5.EncryptedToMD5(password)));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return new ResponseEntity<>(HttpStatus.valueOf(200));
        } else {
            return new ResponseEntity<>("wrong userId",
                    HttpStatus.valueOf(404));
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> post(@RequestBody User input) {
        if (userRepository.findByUsername(input.getUsername())==null) {
            userRepository.save(input);
            emailService.sendSimpleMessage(input.getEmail(),"welcome my shop","test mail");
            return new ResponseEntity<>(null,
                    HttpStatus.valueOf(201));
        } else return new ResponseEntity<>(null, HttpStatus.valueOf(404));
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(){
        SecurityContextHolder.clearContext();
        return new ResponseEntity<>(HttpStatus.valueOf(200));
    }
}

