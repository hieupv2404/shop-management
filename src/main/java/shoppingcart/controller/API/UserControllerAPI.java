package shoppingcart.controller.API;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;
import shoppingcart.entity.*;
import shoppingcart.repository.*;

import java.security.Principal;
import java.util.Date;
import java.util.List;

@Repository
@RequestMapping("/user/API/")
public class UserControllerAPI {
    @Autowired
    ReviewRepository reviewRepository;
    @Autowired
    RateRepository rateRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    UserRepository userRepository;

    @GetMapping("/check/rate/{productId}")
    public ResponseEntity<?> getRate(@PathVariable(name = "productId") Integer productId, Principal principal) {
        if (productRepository.findById(productId).isPresent()) {
            List<Order> orderList = orderRepository.findAllByUserIdAndDeliveredEquals(userRepository.findByUsername(principal.getName()).getId(), true);
            for (Order order : orderList) {
                for (OrderDetail orderDetail : order.getOrderDetails()) {
                    if (orderDetail.getProduct().getId().equals(productId) && !orderDetail.getRated()) {
//                            httpSession.setAttribute("ratePermitsMsg", "Can rate");
                        return new ResponseEntity<>(true, HttpStatus.OK);
                    }
                }
            }
            return new ResponseEntity<>(false, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
    }

    @PostMapping("/add/review/{productId}")
    public ResponseEntity<?> postReview(@PathVariable(name = "productId") Integer productId, Principal principal, @RequestParam String comment) {
        if (!productRepository.findById(productId).isPresent())
            return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
        Review review = new Review();
        review.setUser(userRepository.findByUsername(principal.getName()));
        review.setComment(comment);
        review.setDateCreate(new Date());
        review.setProduct(productRepository.getById(productId));
        reviewRepository.save(review);
        return new ResponseEntity<>(null,HttpStatus.OK);
    }

    @PostMapping("/add/rate/{productId}")
    public ResponseEntity<?> postRate(@PathVariable(name = "productId") Integer productId, Principal principal,@RequestParam Integer rating) {
        if (productRepository.findById(productId).isPresent()&&rating>=1&&rating<=5) {
            List<Order> orderList = orderRepository.findAllByUserIdAndDeliveredEquals(userRepository.findByUsername(principal.getName()).getId(), true);
            boolean foundOrderProduct = false;
            for (Order order : orderList) {
                    for (OrderDetail orderDetail : order.getOrderDetails()) {
                        if (orderDetail.getProduct().getId().equals(productId)&&!orderDetail.getRated()) {
                            Product product=productRepository.getById(productId);
                            orderDetail.setRated(true);
                            Rate rate=new Rate();
                            rate.setRateStar(rating);
                            rate.setUser(userRepository.findByUsername(principal.getName()));
                            rate.setProduct(product);
                            rateRepository.save(rate);
                            float aFloat=(float)rating;
                            product.setRateAverage((product.getRateAverage() * product.getRateCount()) +  aFloat/ (product.getRateCount() + 1));
                            product.setRateCount(product.getRateCount()+1);
                            productRepository.save(product);
                            return new ResponseEntity<>(null, HttpStatus.OK);
                        }
                    }
            }
            return new ResponseEntity<>("No product delivered to rate",HttpStatus.CONFLICT);
        }
            return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
    }
}
