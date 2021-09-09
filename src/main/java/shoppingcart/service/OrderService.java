package shoppingcart.service;

import shoppingcart.DTO.CartDTO;
import shoppingcart.DTO.Item;
import shoppingcart.entity.Cart;
import shoppingcart.entity.Order;
import shoppingcart.entity.OrderDetail;
import shoppingcart.entity.User;

import java.util.ArrayList;
import java.util.HashMap;


public interface OrderService extends IGeneralService<Order>{
    Integer saveOder(Order order);
    Order makeOder(User user, Long totalPrice, HashMap<Integer, Item> carts);

}
