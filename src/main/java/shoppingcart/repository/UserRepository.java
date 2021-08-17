package shoppingcart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shoppingcart.entity.User;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findByUsername(String username);
}