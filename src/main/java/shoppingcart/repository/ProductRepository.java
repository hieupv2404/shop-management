package shoppingcart.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import shoppingcart.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    //
//    @Query("SELECT u FROM Product u where u.category.id=:categoryId")
//     Iterable<Product> getProductsByCategoryId(@Param("categoryId") Integer categoryId);

    Iterable<Product> findAllByCategory_Id(Integer categoryId);

    Page<Product> findAllByNameContainingOrCategory_Name(String keySearch,String categoryName, Pageable pageable);

    Page<Product> findAllByNameContainingOrCategory_NameOrderByNameAsc(String keySearch,String categoryName, Pageable pageable);

    Page<Product> findAllByNameContainingOrCategory_NameOrderByNameDesc(String keySearch,String categoryName, Pageable pageable);

    Page<Product> findAllByNameContainingOrCategory_NameOrderByPriceDesc(String keySearch,String categoryName, Pageable pageable);

    Page<Product> findAllByNameContainingOrCategory_NameOrderByPriceAsc(String keySearch,String categoryName, Pageable pageable);

    List<Product> findAllByCategory_Name(String categoryName);

    List<Product> findAllByCategory_NameOrderByNameAsc(String categoryName);

    List<Product> findAllByCategory_NameOrderByNameDesc(String categoryName);

    List<Product> findAllByCategory_NameOrderByPriceDesc(String categoryName);

    List<Product> findAllByCategory_NameOrderByPriceAsc(String categoryName);
}
