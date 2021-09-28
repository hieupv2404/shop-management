package shoppingcart.controller.API;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/API/")
public class AnonymousControllerAPI {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;

    @GetMapping("/get/product")
    public ResponseEntity<?> getDetailsProduct(@RequestParam(name = "id") Integer id) {
        if (productRepository.findById(id).isPresent()) {
            return new ResponseEntity<>(productRepository.getById(id), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("null", HttpStatus.BAD_REQUEST);
        }
    }


}
