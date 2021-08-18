package shoppingcart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shoppingcart.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
}
