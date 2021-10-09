package shoppingcart.controller.API;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import shoppingcart.DTO.UserDto;
import shoppingcart.controller.UserController;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;

import java.util.stream.Collectors;

@RestController
@RequestMapping("/admin/API/")
public class AdminControllerAPI {
    @Autowired
    UserRepository userRepository;

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
}