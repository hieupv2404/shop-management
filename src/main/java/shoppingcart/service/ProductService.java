package shoppingcart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;

public interface ProductService extends IGeneralService<Product> {
    boolean save(Product product, MultipartFile uploadImage);
    public Product updateProduct( Product product,MultipartFile uploadImage );
}
