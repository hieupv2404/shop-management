package shoppingcart.service.impl;

import lombok.Data;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import shoppingcart.entity.Product;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.ProductService;
import shoppingcart.service.UploadService;

import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UploadService uploadService;

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
        return productRepository.findAllByCategory_Id(categoryId);
    }

    public boolean save(Product product, MultipartFile uploadImage) {
        try {
            //upload ảnh
            if (uploadImage != null) {
                //tiến hành upload
                String uploadPath = uploadService.upload(uploadImage);
                if (uploadPath != null) {
                    product.setImage(uploadPath);
                } else {
                    return false;
                }
            }
            productRepository.save(product);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @Override
    public Product updateProduct(Product product, MultipartFile uploadImage) {
        if (product != null) {
            Product product1 = productRepository.getById(product.getId());
            if (product1 != null) {
                product1.setName(product.getName());
                product1.setPrice(product.getPrice());
                product1.setRateAverage(product.getRateAverage());
                product1.setCategory(product.getCategory());
                //upload ảnh
                //tiến hành upload
                if (uploadImage.getOriginalFilename() != null && !uploadImage.getOriginalFilename().isEmpty()) {
                    String uploadPath = uploadService.upload(uploadImage);
                    product1.setImage(uploadPath);
                } else {
                    product1.setImage(product.getImage());
                }
                return productRepository.save(product1);
            }
        }
        return null;
    }

//    @Override
//    public void deleteProduct(Integer id) {
//        Session session = sessionFactory.getCurrentSession();
//        Query deleteQuery = session.createQuery("DELETE FROM Product p WHERE p.id = :id");
//        deleteQuery.setParameter("id", id);
//        deleteQuery.executeUpdate();
//    }
    
}
