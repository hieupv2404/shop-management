package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import shoppingcart.DTO.CartDtoProductUser;
import shoppingcart.DTO.ChangePasswordDto;
import shoppingcart.DTO.Item;
import shoppingcart.entity.*;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
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

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private OrderService orderService;

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

    @PostMapping("/addCart")
    public ResponseEntity<?> addCart(@RequestParam(name = "productId") Integer productId,
                                     @RequestParam(name = "userId") Integer userId,
                                     @RequestParam(name = "amount") Integer amount,
                                     HttpServletRequest httpServletRequest, HttpSession session) {
        System.out.println(productId);
        System.out.println(userId);
        System.out.println(amount);
        Product product = productService.findById(productId).get();
        Item item = new Item(product, amount);
        HashMap<Integer, Item> cart = null;
        if (session.getAttribute("cart") == null) {
            cart = new HashMap<>();
        } else {
            cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        }
        if (cart.containsKey(productId)) {
            cart.get(productId).setQuantity(cart.get(productId).getQuantity() + amount);
        } else {
            cart.put(productId, item);
        }
        session.setAttribute("userId", userId);
        session.setAttribute("cart", cart);
//        return "homeAfterSignIn";
        return new ResponseEntity<>(cart, HttpStatus.OK);
    }

    @GetMapping("/showCart")
    public ResponseEntity<?> showCart(ModelMap modelMap, HttpSession session) {
        if (session.getAttribute("cart") != null) {
            HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
            modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
            return new ResponseEntity<>(cart, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
    }


    @DeleteMapping("/deleteCart")
    public ResponseEntity<?> deleteCartItem(@RequestParam(name = "productId") Integer productId, HttpSession session) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        cart.remove(productId);
        session.setAttribute("cart", cart);
        return new ResponseEntity<>(cart, HttpStatus.OK);
    }

    @PutMapping("/editCart")
    public ResponseEntity<?> editCart(@RequestParam(name = "productId") Integer productId,
                           @RequestParam(name = "amount1") Integer amount1, HttpSession session) {
        Item item = new Item();
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        System.out.println(cart);
        item = cart.get(productId);
        if (amount1 < 1) {
            cart.remove(productId);
        } else {
            item.setQuantity(amount1);
            cart.put(productId, item);
        }
        session.setAttribute("cart", cart);
        return new ResponseEntity<>(cart, HttpStatus.OK);
    }

//    @PostMapping(value = "/checkoutCart")
//    public ResponseEntity<?> checkoutOder(@Valid @ModelAttribute("user") User user,
//                               BindingResult bindingResult,
//                               ModelMap modelMap, HttpSession session) {
//        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
//        modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
//        if (bindingResult.hasErrors()) {
//            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
//        } else {
//            Order order = orderService.makeOder(user, cartSerice.getTotalCart(cart), cart);
//            modelMap.addAttribute("order", order);
//            List<OrderDetail> listOrderDetail = orderDetailService.findByOrder(order);
//            modelMap.addAttribute("listOrderDetail", listOrderDetail);
//            session.removeAttribute("cart");
//            return new ResponseEntity<>(cart, HttpStatus.OK);
//        }
//        }

}
