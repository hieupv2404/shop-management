package shoppingcart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;
import shoppingcart.DTO.Item;
import shoppingcart.DTO.utils.ListUtils;
import shoppingcart.entity.*;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.repository.ReviewRepository;
import shoppingcart.service.CartSerice;
import shoppingcart.service.ProductService;
import shoppingcart.service.UserService;
import shoppingcart.service.*;
import shoppingcart.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
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
    private ReviewRepository reviewRepository;
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
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

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
        if (!SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString().equals("[ROLE_ANONYMOUS]")) {
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
        if (isLogin(modelMap, httpSession) && !SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString().equals("[ROLE_ADMIN]"))
            return "homeAfterSignIn";
        if (isLogin(modelMap, httpSession) && SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString().equals("[ROLE_ADMIN]"))
            return "redirect:/admin/get/dashboard";
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
                          @RequestParam(name = "amount") Integer amount,
                          HttpServletRequest httpServletRequest, HttpSession session) {
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
        return "redirect:" + httpServletRequest.getHeader("Referer");
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
    public String checkoutOder(@Valid @ModelAttribute("user") User user,
                               BindingResult bindingResult,
                               ModelMap modelMap, HttpSession session) {
        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
        modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
        if (bindingResult.hasErrors()) {
            return "checkout";
        } else {
            Order order = orderService.makeOder(user, cartSerice.getTotalCart(cart), cart);
            modelMap.addAttribute("order", order);
            List<OrderDetail> listOrderDetail = orderDetailService.findByOrder(order);
            modelMap.addAttribute("listOrderDetail", listOrderDetail);
            session.removeAttribute("cart");
            return "checkout-success";
        }
//        HashMap<Integer, Item> cart = (HashMap<Integer, Item>) session.getAttribute("cart");
//        modelMap.addAttribute("totalCart", cartSerice.getTotalCart(cart));
    }

//    @GetMapping(value = "/checkoutSuccess")
//    public String checkoutSuccess(ModelMap modelMap) {
//
//        return "checkout-success";
//    }

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
        if (isLogin(modelMap, httpSession)) {
            if (httpSession.getAttribute("ratePermitsMsg") != null) {
                modelMap.addAttribute("ratePermitsMsg", httpSession.getAttribute("ratePermitsMsg"));
            }
            return "detailsProductAfterSignIn";
        }
        setUpSignInAndSignUp(modelMap, httpSession);
        return "detailsProduct";
    }

    @GetMapping("/search/product/{sort}")
    public String searchProduct(@PathVariable(name = "sort") String sort, @RequestParam(name = "keySearch") String keySearch, ModelMap modelMap, HttpSession httpSession, @RequestParam Integer pageIndex, @RequestParam Integer size) {
        modelMap.addAttribute("keySearch", keySearch);
        keySearch = keySearch.trim();
        if (pageIndex > 0 && size > 0) {
            Pageable pageable = PageRequest.of(pageIndex - 1, size);
            Page<Product> page;
            switch (sort) {
                case "nameAsc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllDistinctByNameContainingOrCategory_NameContainingOrderByNameAsc(keySearch, keySearch, pageable);

                    break;
                case "nameDesc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllDistinctByNameContainingOrCategory_NameContainingOrderByNameDesc(keySearch, keySearch, pageable);

                    break;
                case "priceDesc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllDistinctByNameContainingOrCategory_NameContainingOrderByPriceDesc(keySearch, keySearch, pageable);

                    break;
                case "priceAsc":
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllDistinctByNameContainingOrCategory_NameContainingOrderByPriceAsc(keySearch, keySearch, pageable);

                    break;
                default:
                    // Làm gì đó tại đây ...
                    page = productRepository.findAllDistinctByNameContainingOrCategory_NameContaining(keySearch, keySearch, pageable);
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
    public String searchProductByCategory(@PathVariable(name = "sort") String sort, @PathVariable(name = "sex") String sex, @PathVariable(name = "category") String category, ModelMap modelMap, HttpSession httpSession, @RequestParam Integer pageIndex, @RequestParam Integer size) {
        if ((sex.equals("men") || sex.equals("woman")) && (pageIndex > 0 && size > 0)) {
            List<Product> productList;
            switch (sort) {
                case "nameAsc":
                    // Làm gì đó tại đây ...
                    productList = productRepository.findAllByCategory_NameOrderByNameAsc(sex);

                    break;
                case "nameDesc":
                    // Làm gì đó tại đây ...
                    productList = productRepository.findAllByCategory_NameOrderByNameDesc(sex);

                    break;
                case "priceDesc":
                    // Làm gì đó tại đây ...
                    productList = productRepository.findAllByCategory_NameOrderByPriceDesc(sex);

                    break;
                case "priceAsc":
                    // Làm gì đó tại đây ...
                    productList = productRepository.findAllByCategory_NameOrderByPriceAsc(sex);

                    break;
                default:
                    // Làm gì đó tại đây ...
                    productList = productRepository.findAllByCategory_Name(sex);
            }
            List<Product> productList1 = productRepository.findAllByCategory_Name(category);
            productList.removeIf(product -> !productList1.contains(product));
            modelMap.addAttribute("list", ListUtils.getPage(productList, pageIndex - 1, size));
            modelMap.addAttribute("totalPage", ListUtils.getTotalPages(productList, size));
            modelMap.addAttribute("size", size);
            modelMap.addAttribute("currentIndex", pageIndex);
            modelMap.addAttribute("totalProd", productList.size());
            modelMap.addAttribute("sort", sort);
            modelMap.addAttribute("category", category);
            if (isLogin(modelMap, httpSession))
                return "mensAfterSignIn";
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

    @GetMapping("/review/{productId}")
    public String getReview(@PathVariable(name = "productId") Integer productId, ModelMap modelMap, HttpSession httpSession, @RequestParam Integer pageIndex, @RequestParam(required = false, defaultValue = "-1") Integer lastPreviousReviewId) {
        Pageable pageable = PageRequest.of(0, pageIndex * 2);
        if (reviewRepository.findAllByProductIdOrderByDateCreateDesc(productId, pageable).getTotalElements() > 0) {
            Page<Review> reviewPage = reviewRepository.findAllByProductIdOrderByDateCreateDesc(productId, pageable);
            List<Review> reviewList = reviewPage.toList();
            modelMap.addAttribute("reviewList", reviewList);
            modelMap.addAttribute("lastReviewId", reviewList.get(reviewList.size() - 1).getId());
            modelMap.addAttribute("lastPreviousReviewId", lastPreviousReviewId);
            if (reviewPage.getTotalPages() == 1)
                modelMap.addAttribute("endList", true);
            else
                modelMap.addAttribute("endList", false);
        } else
            modelMap.addAttribute("noComment", "This product has no comments, be the first to comment");
        modelMap.addAttribute("pageIndex", pageIndex);
        modelMap.addAttribute("productId", productId);
        return "review";
    }

    public static boolean adminActive=false;
    @GetMapping("/get/chat")
    public String getChat(HttpSession httpSession, HttpServletRequest httpServletRequest, ModelMap modelMap) {
        httpSession.setAttribute("sessionId", httpServletRequest.getSession().getId());
        System.out.println(httpServletRequest.getSession().getId());
        if (!adminActive){
            modelMap.addAttribute("bg","bg-secondary");
            modelMap.addAttribute("line","Offline");
        }
        else {
            modelMap.addAttribute("bg","bg-success");
            modelMap.addAttribute("line","Online");
        }
        return "chat";
    }

    @MessageMapping("/say/{sessionId}")
    @SendTo({"/app/chat/{sessionId}","/app/say/chat/admin"})
    public Greeting sayToClient(HelloMessage helloMessage, @DestinationVariable String sessionId) throws Exception {
        System.out.println("Say to Client " + sessionId);
        Greeting greeting = new Greeting(HtmlUtils.htmlEscape(helloMessage.getName()));
        greeting.setId(sessionId + "_admin");
        greeting.setSender("admin");
        greeting.setDate(new Date());
        greeting.setSessionId(sessionId);
        return greeting;
    }

    @MessageMapping("/say/admin/{sessionId}")
    @SendTo({"/app/say/chat/admin", "/app/chat/{sessionId}"})
    public Greeting sayToAdmin(HelloMessage helloMessage, @DestinationVariable String sessionId) throws Exception {
        System.out.println("Say to Admin");
        Greeting greeting = new Greeting(HtmlUtils.htmlEscape(helloMessage.getName()));
        greeting.setSender("client");
        greeting.setId(sessionId + "_" +greeting.getSender());
        greeting.setDate(new Date());
        greeting.setSessionId(sessionId);
        if (!adminActive) {
            Greeting greeting1=new Greeting("admin not here, sorry about that, pls try later");
            greeting1.setSender("admin");
            greeting1.setId(sessionId + "_" +greeting1.getSender());
            greeting1.setDate(new Date());
            greeting1.setSessionId(sessionId);
            messagingTemplate.convertAndSend("/app/chat/" + sessionId, greeting);
            return greeting1;
        }
        return greeting;
    }

    @SubscribeMapping({"/say/chat/admin"})
    @SendTo("/app/say/info")
    public  Greeting sendInfoOn() {
        adminActive=true;
        return new Greeting("online");
    }

    @SubscribeMapping("app/say/info")
    @SendTo("/app/say/info")
    public  Greeting sendInfoOff() {
        if (!adminActive)
            return new Greeting("offline");
        else return new Greeting("online");
    }

}
