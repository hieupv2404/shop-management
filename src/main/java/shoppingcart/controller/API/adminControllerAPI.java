package shoppingcart.controller.API;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import shoppingcart.DTO.UserDto;
import shoppingcart.controller.UserController;
import shoppingcart.entity.Category;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.repository.CategoryRepository;
import shoppingcart.repository.UserRepository;
import shoppingcart.service.CategoryService;
import shoppingcart.service.ProductService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/admin/API/")
public class AdminControllerAPI {
    @Autowired
    UserRepository userRepository;
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    CategoryRepository categoryRepository;

    @GetMapping("/get/users")
    public ResponseEntity<?> getUsers() {
        ModelMapper modelMapper = new ModelMapper();
        return new ResponseEntity<>(userRepository.findAllByAdminFalse().stream().map(user -> modelMapper.map(user, UserDto.class)).collect(Collectors.toList()), HttpStatus.OK);
    }

    @GetMapping("/get/details/user")
    public ResponseEntity<?> getDetailsUser(@RequestParam Integer id) {
        ModelMapper modelMapper = new ModelMapper();
        if (userRepository.findById(id).isPresent())
        return new ResponseEntity<>(userRepository.findById(id).map(user -> modelMapper.map(user, UserDto.class)),HttpStatus.OK);
        return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
    }

    @PutMapping("/put/block/user")
    public ResponseEntity<?> putBlockUser(@RequestParam Integer id) {
        if (userRepository.findById(id).isPresent()) {
            User user = userRepository.findById(id).get();
            user.setBlock(true);
            userRepository.save(user);
            return new ResponseEntity<>(null,HttpStatus.OK);
        }
        return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
    }

    @PutMapping("/put/unblock/user")
    public ResponseEntity<?> putUnblockUser(@RequestParam Integer id) {
        if (userRepository.findById(id).isPresent()) {
            User user = userRepository.findById(id).get();
            user.setBlock(false);
            userRepository.save(user);
            return new ResponseEntity<>(null,HttpStatus.OK);
        }
        return new ResponseEntity<>(null,HttpStatus.BAD_REQUEST);
    }


//    @GetMapping("/showProduct")
//    public ResponseEntity<Iterable<Product>> findAllProduct() {
//        List<Product> products = (List<Product>) productService.findAll();
//        if (products.isEmpty()) {
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        }
//        return new ResponseEntity<>(products, HttpStatus.OK);
//    }

}

