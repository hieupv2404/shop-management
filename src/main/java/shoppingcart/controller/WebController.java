package shoppingcart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.DTO.Item;
import shoppingcart.DTO.utils.ListUtils;
import shoppingcart.entity.Cart;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.CartSerice;
import shoppingcart.service.ProductService;
import shoppingcart.service.UserService;
import shoppingcart.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

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
        Integer userId = (Integer) session.getAttribute("userId");
        List<Cart> cartList = cartSerice.findByUserId(userId);
        modelMap.addAttribute("cartList", cartList);
        modelMap.addAttribute("total", cartSerice.getTotal(userId));
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
        return "redirect:showCart";
    }

    @PostMapping("/editCart")
    public String editCart(@RequestParam(name = "cartId") Integer cartId,
                           @RequestParam(name = "amount") Integer amount,
                           @RequestParam(name = "amount1") Integer amount1, HttpSession session) {
//        Item item = new Item();
//        HashMap<Integer, Item> cart = ( HashMap<Integer, Item>) session.getAttribute("cart");
//        item.setQuantity(amount);
//        item.setQuantity(amount1);
//        session.setAttribute("cart", cart);


//        Cart cart = cartSerice.findById(cartId).get();
//        cart.setAmount(amount);
//        cart.setAmount(amount1);
//        Cart cart2 = cartSerice.update(cart);
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
    public String checkoutCart(ModelMap modelMap) {

        return "checkout";
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

    @GetMapping("/search/product/{sort}")
    public String searchProduct(@PathVariable(name = "sort") String sort, @RequestParam(name = "keySearch") String keySearch, ModelMap modelMap, HttpSession httpSession, @RequestParam Integer pageIndex, @RequestParam Integer size) {
        modelMap.addAttribute("keySearch", keySearch);
        if (pageIndex > 0 && size > 0) {
            Pageable pageable = PageRequest.of(pageIndex - 1, size);
            Page<Product> page;
            switch (sort) {
                case "nameAsc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllByNameContainingOrderByNameAsc(keySearch, pageable);

                    break;
                case "nameDesc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllByNameContainingOrderByNameDesc(keySearch, pageable);

                    break;
                case "priceDesc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllByNameContainingOrderByPriceDesc(keySearch, pageable);

                    break;
                case "priceAsc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllByNameContainingOrderByPriceAsc(keySearch, pageable);

                    break;
                default:
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllByNameContaining(keySearch, pageable);
            }
            modelMap.addAttribute("list", page.toList());
            modelMap.addAttribute("totalPage", page.getTotalPages());
            modelMap.addAttribute("size", size);
            modelMap.addAttribute("currentIndex", pageIndex);
            modelMap.addAttribute("totalProd", page.getTotalElements());
            modelMap.addAttribute("sort", sort);
            if (isLogin(modelMap, httpSession))
                return "searchResultAfterSignIn";
            setUpSignInAndSignUp(modelMap, httpSession);
            return "searchResult";
        } else {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "forbidden");
            return "errorPage";
        }
    }

    @GetMapping("/search/category/{sort}/{sex}/{category}")
    public String searchProductByCategory(@PathVariable(name = "sort") String sort, @PathVariable(name = "sex") String sex, @PathVariable(name = "category") String keySearch, ModelMap modelMap, HttpSession httpSession, @RequestParam Integer pageIndex, @RequestParam Integer size) {
        if ((sex.equals("men") || sex.equals("woman")) && (pageIndex > 0 && size > 0)) {
            List<Product> productList = productRepository.findAllByCategory_Name(sex);
            List<Product> productList1 = productRepository.findAllByCategory_Name(keySearch);
            productList.removeIf(product -> !productList1.contains(product));
            modelMap.addAttribute("list", ListUtils.getPage(productList, pageIndex - 1, size));
            if (isLogin(modelMap, httpSession))
                return "searchResultAfterSignIn";
            setUpSignInAndSignUp(modelMap, httpSession);
            return "mens";
        } else {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "forbidden");
            return "errorPage";
        }
    }
}
