package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import shoppingcart.DTO.CartDtoProductUser;
import shoppingcart.DTO.ChangePasswordDto;
import shoppingcart.entity.Cart;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.service.CartSerice;
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

    @Autowired
    private CartSerice cartSerice;

    @PutMapping("/updateUser/{id}")
    public User updateUser(@PathVariable Integer id, @RequestBody User user) {
        return userService.updateUser(id, user);

    }

    @PutMapping("/updatePassword")
    public User updatePassword(@RequestBody ChangePasswordDto changePasswordDto) {
        return userService.updatePassword(changePasswordDto);
    }

    @GetMapping("/showUser/{id}")
    public ResponseEntity<User> showUser(@PathVariable Integer id) {
        Optional<User> userOptional = userService.findById(id);
        if (!userOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(userOptional.get(), HttpStatus.OK);
    }

    @GetMapping("/showProduct")
    public ResponseEntity<Iterable<Product>> findAllProduct() {
        List<Product> products = (List<Product>) productService.findAll();
        if (products.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(products, HttpStatus.OK);
    }


    @GetMapping()
    public ResponseEntity<Iterable<User>> findAllUser() {
        List<User> users = (List<User>) userService.findAll();
        if (users.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @GetMapping("/showCart/{userId}")
    public ResponseEntity<Iterable<Cart>> findAllCart(@PathVariable Integer userId) {
        List<Cart> carts = cartSerice.findByUserId(userId);
        if (carts.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(carts, HttpStatus.OK);
    }

//    @PostMapping("/addCart")
//    public ResponseEntity<CartDtoProductUser> saveCart(@RequestBody CartDtoProductUser cart) {
//        return new ResponseEntity<>(cartSerice.save(cart), HttpStatus.CREATED);
//    }
//
//    @PutMapping("/updateCart/{id}")
//    public ResponseEntity<CartDtoProductUser> updateCart(@PathVariable Integer id ,@RequestBody CartDtoProductUser cart) {
//        Optional<Cart> cartOptional = cartSerice.findById(id);
//        if (!cartOptional.isPresent()) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//        cart.setId(cartOptional.get().getId());
//        return new ResponseEntity<>(cartSerice.update(cart), HttpStatus.OK);
//    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Cart> deleteCart(@PathVariable Integer id) {
        Optional<Cart> cartOptional = cartSerice.findById(id);
        if (!cartOptional.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        cartSerice.remove(id);
        return new ResponseEntity<>(cartOptional.get(), HttpStatus.NO_CONTENT);
    }

}
