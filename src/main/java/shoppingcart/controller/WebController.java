package shoppingcart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import shoppingcart.DTO.Item;
import shoppingcart.entity.*;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.*;
import shoppingcart.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Controller
public class WebController {
    @Autowired
    public ProductServiceImpl productServiceImpl;
    @Autowired
    public CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    public ProductService productService;
    @Autowired
    private CartSerice cartSerice;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDetailService orderDetailService;

    private void setUpSignInAndSignUp(ModelMap modelMap, HttpSession httpSession) {
        modelMap.addAttribute("user", new User());
        modelMap.addAttribute("userSignIn", new User());
        if (httpSession.getAttribute("againUser") != null) {
            modelMap.addAttribute("againUser", httpSession.getAttribute("againUser"));
        }
        if (httpSession.getAttribute("errorSignIn") != null) {
            modelMap.addAttribute("errorSignIn", httpSession.getAttribute("errorSignIn"));
        }
        if (httpSession.getAttribute("errorUsername") != null) {
            modelMap.addAttribute("errorUsername", httpSession.getAttribute("errorUsername"));
        }
        if (httpSession.getAttribute("errorEmail") != null) {
            modelMap.addAttribute("errorEmail", httpSession.getAttribute("errorEmail"));
        }
        if (httpSession.getAttribute("errorPhone") != null) {
            modelMap.addAttribute("errorPhone", httpSession.getAttribute("errorPhone"));
        }
        if (httpSession.getAttribute("existUsername") != null) {
            modelMap.addAttribute("existUsername", httpSession.getAttribute("existUsername"));
        }
        if (httpSession.getAttribute("existEmail") != null) {
            modelMap.addAttribute("existEmail", httpSession.getAttribute("existEmail"));
        }
    }

    private Boolean isLogin(ModelMap modelMap, HttpSession httpSession) {
        if (!SecurityContextHolder.getContext().getAuthentication().getName().equals("anonymousUser")) {
            modelMap.addAttribute("name", SecurityContextHolder.getContext().getAuthentication().getName());
            if (httpSession.getAttribute("userId") != null) {
                modelMap.addAttribute("userId", httpSession.getAttribute("userId"));
            }
            return true;
        }
        return false;
    }

    @GetMapping("")
    public String getHome(ModelMap modelMap, HttpSession httpSession) {
        Iterable<Category> categories = categoryRepository.findAll();
        categories.forEach(category -> {
            Iterable<Product> productIterable = productServiceImpl.getProductsByCategoryId(category.getId());
            modelMap.addAttribute(category.getName(), productIterable);
        });
        if (isLogin(modelMap, httpSession))
            return "homeAfterSignIn";
        setUpSignInAndSignUp(modelMap, httpSession);
        return "home";
    }

    @GetMapping("/showCart")
    public String showCart(ModelMap modelMap, HttpSession session) {
//        Integer userId = (Integer) session.getAttribute("userId");
//        List<Cart> cartList = cartSerice.findByUserId(userId);
//        modelMap.addAttribute("cartList", cartList);
//        modelMap.addAttribute("total", cartSerice.getTotal(userId));
//        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        if (session.getAttribute("cart") != null) {
            HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
            modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
        }
        return "cart";
    }

    @PostMapping("/addCart")
    public String addCart(@RequestParam(name = "productId") Integer productId,
                          @RequestParam(name = "userId") Integer userId,
                          @RequestParam(name = "amount") Integer amount, HttpSession session) {
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
        session.setAttribute("cart", cart);
        return "homeAfterSignIn";
    }

    @PostMapping("/editCart")
    public String editCart(@RequestParam(name = "productId") Integer productId,
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
        return "redirect:showCart";
    }

    @GetMapping("/deleteCart")
    public String deleteCartItem(@RequestParam(name = "productId") Integer productId, HttpSession session) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        cart.remove(productId);
        session.setAttribute("cart", cart);
        return "redirect:showCart";
    }

    @GetMapping("/checkoutCart")
    public String checkoutCart(ModelMap modelMap, HttpSession session) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
        if (session.getAttribute("userId") != null) {
            Integer userId = (Integer) session.getAttribute("userId");
            User user = userService.findById(userId).get();
            modelMap.addAttribute("user", user);
        }
        return "checkout";
    }

    @PostMapping(value = "/checkoutCart")
    public String checkoutOder(@Valid @ModelAttribute("user")  User user,
                               BindingResult bindingResult,
                               ModelMap modelMap, HttpSession session) {
        if (bindingResult.hasErrors()){
            return "checkout";
        }
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
        Order order = orderService.makeOder(user, cartSerice.getTotalCart(cart), cart);
//        session.removeAttribute("cart");
        return "checkout-success";
    }

    @GetMapping("/clearCart")
    public String clearCartItem(HttpSession session) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        cart.clear();
        session.setAttribute("cart", cart);
        return "redirect:showCart";
    }


    @GetMapping(value = "/mens.htm")
    public ModelAndView showMen() {
        ModelAndView mav = new ModelAndView("mens");
        Iterable<Product> productIterable = productService.findAll();
        mav.addObject("productIterable", productIterable);
        return mav;
    }

    @GetMapping("/show/product")
    public String showDetailsProduct(@RequestParam(name = "id") Integer id, ModelMap modelMap, HttpSession httpSession) {
        if (productRepository.findById(id).isPresent()) {
            modelMap.addAttribute("product", productRepository.getById(id));
        } else {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "your access is denied");
            return "errorPage";
        }
        if (isLogin(modelMap, httpSession))
            return "detailsProductAfterSignIn";
        setUpSignInAndSignUp(modelMap, httpSession);
        return "detailsProduct";
    }


}
