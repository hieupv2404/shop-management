package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/get/all")
    public ResponseEntity<?> getAllUser(Principal principal){
        List<User> users;
        users = userRepository.findAll();
        return new ResponseEntity<>(users, HttpStatus.valueOf(200));
    }
}
