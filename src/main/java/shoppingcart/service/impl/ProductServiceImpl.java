package shoppingcart.service.impl;

//import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import shoppingcart.entity.Product;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.ProductService;

import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Iterable<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Optional<Product> findById(Integer id) {
        return productRepository.findById(id);
    }

    @Override
    public Product save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public void remove(Integer id) {
        productRepository.deleteById(id);
    }

//T
    public Iterable<Product> getProductsByCategoryId(Integer categoryId) {
        Iterable<Product> listResult = productRepository.getProductsByCategoryId(categoryId);
        return listResult;
    }
}
