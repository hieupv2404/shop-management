package shoppingcart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shoppingcart.DTO.CartDTO;
import shoppingcart.DTO.CartDtoProductUser;
import shoppingcart.DTO.Item;
import shoppingcart.converter.Converter;
import shoppingcart.entity.Cart;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;
import shoppingcart.repository.CartRepository;
import shoppingcart.repository.ProductRepository;
import shoppingcart.service.CartSerice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class CartImpl implements CartSerice {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private Converter converter;

    @Override
    public Iterable<Cart> findAll() {
        return cartRepository.findAll();
    }

    @Override
    public Optional<Cart> findById(Integer id) {
        return cartRepository.findById(id);
    }

    @Override
    public Cart save(Cart cart) {
        return cartRepository.save(cart);
    }

    @Override
    public void remove(Integer id) {
        cartRepository.deleteById(id);
    }

    @Override
    public List<Cart> findByUserId(Integer userId) {
        return cartRepository.findByUserId(userId);
    }

    @Override
    public Cart update(Cart cart) {
        return cartRepository.save(cart);
    }

    @Override
    public Cart findByProductId(Integer productId) {
        return cartRepository.findByProductId(productId);
    }


    @Override
    public Integer addToCart(Integer productId, Integer amount, User user) {
        Integer addedAmount = amount;
        Product product = productRepository.findById(productId).get();
        Cart cart = cartRepository.findByUserIdAndProductId(user.getId(), productId);
        if (cart != null) {
            addedAmount = cart.getAmount() + amount;
            cart.setAmount(addedAmount);
        } else {
            cart = new Cart();
            cart.setAmount(amount);
            cart.setUser(user);
            cart.setProduct(product);
        }
        cartRepository.save(cart);
        return addedAmount;
    }

    public Integer getTotal(Integer userId) {
        Integer total = 0;
        for (Cart cart: findByUserId(userId)) {
            total = Math.toIntExact(total + cart.getProduct().getPrice() * cart.getAmount());
        }
        return total;
    }

    public long getTotalCart(HashMap<Integer, Item> carts) {
       long total = 0;
        for(Map.Entry<Integer, Item> cart : carts.entrySet()) {
            total += cart.getValue().getProduct().getPrice()*cart.getValue().getQuantity();
        }
        return total;
    }

//    @Override
//    public CartDtoProductUser save(CartDtoProductUser cartDtoProductUser) {
//        Product product = productRepository.findOneById(cartDtoProductUser.getProductId());
//        Cart cart = converter.toCart(cartDtoProductUser);
//        cart.setProduct(product);
//        cart = cartRepository.save(cart);
//        return converter.toCartDtoProductUser(cart);
//    }
//
//
//    @Override
//    public CartDtoProductUser update(CartDtoProductUser cartDtoProductUser) {
//        Cart oldCart = cartRepository.getById(cartDtoProductUser.getId());
//        Cart cart = converter.toCart(cartDtoProductUser,oldCart);
//        Product product = productRepository.findOneById(cartDtoProductUser.getProductId());
//        cart.setProduct(product);
//        cart = cartRepository.save(cart);
//        return converter.toCartDtoProductUser(cart);
//    }

}
