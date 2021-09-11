package shoppingcart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shoppingcart.entity.Rate;

@Repository
public interface RateRepository extends JpaRepository<Rate, Integer> {
}
