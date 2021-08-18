package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.ProductService;
import shoppingcart.service.UserService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @PutMapping("/updateUser/{id}")
    public User updateUser(@PathVariable Integer id, @RequestBody User user) {
        return userService.updateUser(id,user);

    }

//    @PutMapping("/updatePassword/{id}/{oldPassword}")
//    public User updatePassword(@PathVariable Integer id, @PathVariable String oldPassword, @RequestBody User user) {
//        return userService.updatePassword(id,user,oldPassword);
//    }
//
//    @GetMapping("/showUser/{id}")
//    public ResponseEntity<User> showUser(@PathVariable Integer id) {
//        Optional<User> userOptional = userService.findById(id);
//        if (!userOptional.isPresent()) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//        return new ResponseEntity<>(userOptional.get(), HttpStatus.OK);
//    }
//
//    @GetMapping("/showProduct")
//    public ResponseEntity<Iterable<Product>> findAllProduct() {
//        List<Product> products = (List<Product>) productService.findAll();
//        if (products.isEmpty()) {
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        }
//        return new ResponseEntity<>(products, HttpStatus.OK);
//    }
//
//
//    @GetMapping()
//    public ResponseEntity<Iterable<User>> findAllUser() {
//        List<User> users = (List<User>) userService.findAll();
//        if (users.isEmpty()) {
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        }
//        return new ResponseEntity<>(users, HttpStatus.OK);
//    }

}
