package shoppingcart.service;

import shoppingcart.DTO.CartDTO;
import shoppingcart.DTO.CartDtoProductUser;
import shoppingcart.DTO.Item;
import shoppingcart.entity.Cart;
import shoppingcart.entity.Product;
import shoppingcart.entity.User;

import java.util.HashMap;
import java.util.List;

public interface CartSerice extends IGeneralService<Cart> {
    public List<Cart> findByUserId(Integer userId);
    public Integer addToCart(Integer id, Integer amount, User user);
    public Cart update(Cart cart);
    public Cart findByProductId(Integer productId);
    public Integer getTotal(Integer userId);
    public long getTotalCart(HashMap<Integer, Item> carts);
//    CartDtoProductUser save(CartDtoProductUser cartDtoProductUser);
//    CartDtoProductUser update(CartDtoProductUser cartDtoProductUser);
}
