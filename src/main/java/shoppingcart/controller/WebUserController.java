package shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import shoppingcart.DTO.ChangePasswordDto;
import shoppingcart.entity.*;
import shoppingcart.repository.OrderRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.repository.ReviewRepository;
import shoppingcart.repository.UserRepository;
import shoppingcart.service.ProductService;
import shoppingcart.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/user")
public class WebUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private OrderRepository orderRepository;

    private boolean checkAccessWrongUserAndActiveById(Integer id, Principal principal) {
        User user = userRepository.findById(id).isPresent() ? userRepository.findById(id).get() : null;
        if (user != null) {
            return !(user.getUsername().equals(principal.getName()) && user.getActive());
        }
        return true;
    }

    private boolean checkAccessWrongUserById(Integer id, Principal principal) {
        User user = userRepository.findById(id).isPresent() ? userRepository.findById(id).get() : null;
        if (user != null) {
            return !user.getUsername().equals(principal.getName());
        }
        return true;
    }


    @GetMapping(value = "/getAll.htm")
    public ModelAndView getAllUser() {
        ModelAndView mav = new ModelAndView("show");
        Iterable<User> userIterable = userService.findAll();
        mav.addObject("userIterable", userIterable);
        return mav;
    }


    @RequestMapping(value = "update/profile.htm", method = RequestMethod.GET)
    public ModelAndView initUpdateProfile(@RequestParam(name = "id") Integer id, Principal principal) {
        if (checkAccessWrongUserAndActiveById(id, principal)) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("errorPre", "4");
            mav.addObject("errorMed", "0");
            mav.addObject("errorSuf", "3");
            mav.addObject("errorName", "your access is denied");
            return mav;
        }
        ModelAndView mav = new ModelAndView("updateProfile");
        Optional<User> userUpdate = userService.findById(id);
        mav.addObject("userUpdate", userUpdate.get());
        return mav;
    }

    @RequestMapping(value = "update/profile.htm", method = RequestMethod.POST)
    public String updateUserProfile(@Valid @ModelAttribute(name = "userUpdate") User userUpdate,
                                    BindingResult bindingResult,
                                    @RequestParam(name = "sex") Boolean sex, Principal principal, ModelMap modelMap) {
        if (bindingResult.hasErrors()) {
            if (bindingResult.hasFieldErrors("birthday"))
                modelMap.addAttribute("errorBirthday", "Date format invalid");
            return "updateProfile";
        }
        if (checkAccessWrongUserAndActiveById(userUpdate.getId(), principal)) {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "your access is denied");
            return "errorPage";
        }
        userUpdate.setSex(sex);
        User user = userService.updateUser(userUpdate.getId(), userUpdate);
        return "redirect:/user/show/profile?id=" + userUpdate.getId();
    }

    @RequestMapping(value = "/change/password.htm", method = RequestMethod.GET)
    public ModelAndView initChangePassword(@RequestParam(name = "id") Integer id, Principal principal, @RequestParam(name = "messages", required = false) String messages) {
        if (checkAccessWrongUserById(id, principal)) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("errorPre", "4");
            mav.addObject("errorMed", "0");
            mav.addObject("errorSuf", "3");
            mav.addObject("errorName", "your access is denied");
            return mav;
        }
        ModelAndView mav = new ModelAndView("changePassword");
        Optional<User> userChangePassword = userService.findById(id);
        mav.addObject("userChangePassword", userChangePassword.get());
        mav.addObject("message", messages);
        return mav;
    }

    @RequestMapping(value = "/change/password.htm", method = RequestMethod.POST)
    public String changePassword(@RequestParam(name = "id") Integer id,
                                 @RequestParam(name = "currentPass") String oldPassword,
                                 @RequestParam(name = "newPass") String password,
                                 Principal principal, ModelMap modelMap, HttpSession httpSession) {
        if (checkAccessWrongUserById(id, principal)) {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "your access is denied");
            return "errorPage";
        }
        ChangePasswordDto changePasswordDto = new ChangePasswordDto();
        changePasswordDto.setId(id);
        changePasswordDto.setOldPassword(oldPassword);
        changePasswordDto.setPassword(password);
        User user = userService.updatePassword(changePasswordDto);
        if (user == null) {
            String messages = "loi roi";
            return "redirect:/user/change/password.htm?id=" + id + "&messages=" + messages;
        } else {
            if (!user.getActive()) {
                user.setActive(true);
                userRepository.save(user);
                httpSession.removeAttribute("notActive");
            }
            httpSession.setAttribute("changePassSs", "true");
            return "redirect:/user/show/profile?id=" + id;
        }
    }


    @RequestMapping(value = "/show/profile", method = RequestMethod.GET)
    public ModelAndView showProduct(int id, Principal principal) {
        if (checkAccessWrongUserById(id, principal)) {
            ModelAndView mav = new ModelAndView("errorPage");
            mav.addObject("errorPre", "4");
            mav.addObject("errorMed", "0");
            mav.addObject("errorSuf", "3");
            mav.addObject("errorName", "your access is denied");
            return mav;
        }
        ModelAndView mav = new ModelAndView("showUser");
        Optional<User> showUser = userService.findById(id);
        mav.addObject("showUser", showUser);
        mav.addObject("userId", id);
        return mav;
    }

    @GetMapping(value = "/initShowProduct.htm")
    public ModelAndView showProduct() {
        ModelAndView mav = new ModelAndView("showProduct");
        Iterable<Product> productIterable = productService.findAll();
        mav.addObject("productIterable", productIterable);
        return mav;
    }

    @PostMapping("/add/review/{productId}")
    public String postReview(@PathVariable(name = "productId") Integer productId, ModelMap modelMap, HttpSession httpSession, Principal principal, @RequestParam String comment) {
        if (!productRepository.findById(productId).isPresent()) {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "your access is denied");
            return "errorPage";
        }
        Review review = new Review();
        review.setUser(userRepository.findByUsername(principal.getName()));
        review.setComment(comment);
        review.setDateCreate(new Date());
        review.setProduct(productRepository.getById(productId));
        reviewRepository.save(review);
        return "redirect:/show/product?id=" + productId;
    }

    @GetMapping("/add/rate/{productId}")
    public String getRate(@PathVariable(name = "productId") Integer productId, ModelMap modelMap, HttpSession httpSession, Principal principal) {
        if (productRepository.findById(productId).isPresent()) {
            modelMap.addAttribute("product", productRepository.getById(productId));
            List<Order> orderList = orderRepository.findAllByUserIdAndDeliveredEquals(userRepository.findByUsername(principal.getName()).getId(), true);
            modelMap.addAttribute("name", SecurityContextHolder.getContext().getAuthentication().getName());
            if (httpSession.getAttribute("userId") != null)
                modelMap.addAttribute("userId", httpSession.getAttribute("userId"));
            boolean foundOrderProduct = false;
            for (Order order : orderList) {
                if (!foundOrderProduct) {
                    for (OrderDetail orderDetail : order.getOrderDetails()) {
                        if (orderDetail.getProduct().getId().equals(productId)) {
                            modelMap.addAttribute("msg", "can rate");
                            foundOrderProduct = true;
                            break;
                        }
                    }
                } else break;
            }
            if (!foundOrderProduct) modelMap.addAttribute("msg", "can't rate");
            return "detailsProductAfterSignIn";
        } else {
            modelMap.addAttribute("errorPre", "4");
            modelMap.addAttribute("errorMed", "0");
            modelMap.addAttribute("errorSuf", "3");
            modelMap.addAttribute("errorName", "your access is denied");
            return "errorPage";
        }
    }
}
