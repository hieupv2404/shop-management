package shoppingcart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import shoppingcart.DTO.DTOUser;
import shoppingcart.entity.User;
import shoppingcart.repository.UserRepository;
import shoppingcart.service.UserService;

import java.util.Optional;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Iterable<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public Optional<User> findById(Integer id) {
        return userRepository.findById(id);
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public void remove(Integer id) {
        userRepository.deleteById(id);
    }

    @Override
    public User updateUser(Integer id, User user) {
        if (user != null) {
            User user1 = userRepository.getById(id);
            if (user1 != null) {
                user1.setFirstName(user.getFirstName());
                user1.setLastName(user.getLastName());
                user1.setBirthday(user.getBirthday());
                user1.setSex(user.getSex());
                user1.setAddress(user.getAddress());
                user1.setPhone(user.getPhone());
                return userRepository.save(user1);
            }
        }
        return null;
    }

    @Override
    public User updatePassword(Integer id, User user, String oldPassword) {
        if (user != null) {
            User user1 = userRepository.getById(id);
            if (user1 != null && oldPassword.equals(user1.getPassword())) {
                user1.setPassword(user.getPassword());
                return userRepository.save(user1);
            }
        }
        return null;
    }


}
