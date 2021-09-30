package shoppingcart.controller.API;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import shoppingcart.DTO.utils.ListUtils;
import shoppingcart.entity.Product;
import shoppingcart.entity.Review;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.repository.ReviewRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/API/")
public class AnonymousControllerAPI {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    ReviewRepository reviewRepository;

    @GetMapping("/get/product")
    public ResponseEntity<?> getDetailsProduct(@RequestParam(name = "id") Integer id) {
        if (productRepository.findById(id).isPresent()) {
            return new ResponseEntity<>(productRepository.getById(id), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("null", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/search/product/{sort}")
    public ResponseEntity<?> searchProduct(@PathVariable(name = "sort") String sort, @RequestParam(name = "keySearch") String keySearch, @RequestParam Integer pageIndex, @RequestParam Integer size) {
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
            return new ResponseEntity<>(page, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
    }

    @GetMapping("/search/category/{sort}/{sex}/{category}")
    public ResponseEntity<?> searchProductByCategory(@PathVariable(name = "sort") String sort, @PathVariable(name = "sex") String sex, @PathVariable(name = "category") String category, @RequestParam Integer pageIndex, @RequestParam Integer size) {
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
            Pageable pageable = PageRequest.of(pageIndex - 1, size);
            productList.removeIf(product -> !productList1.contains(product));
            Page<Product> page = new PageImpl<>(ListUtils.getPage(productList, pageIndex - 1, size), pageable, productList.size());
            return new ResponseEntity<>(page, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/review/{productId}")
    public ResponseEntity<?> getReview(@PathVariable(name = "productId") Integer productId, @RequestParam Integer pageIndex, @RequestParam(required = false, defaultValue = "-1") Integer lastPreviousReviewId) {
        if (pageIndex<=0)
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        Pageable pageable = PageRequest.of(pageIndex-1,  2);
        Page<Review> reviewPage = reviewRepository.findAllByProductIdOrderByDateCreateDesc(productId, pageable);
        List<Review> reviewList = reviewPage.toList();
        return new ResponseEntity<>(reviewPage, HttpStatus.OK);
    }
}
