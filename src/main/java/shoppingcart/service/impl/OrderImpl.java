package shoppingcart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shoppingcart.DTO.Item;
import shoppingcart.entity.Cart;
import shoppingcart.entity.Order;
import shoppingcart.entity.OrderDetail;
import shoppingcart.entity.User;
import shoppingcart.repository.OrderDetailRepository;
import shoppingcart.repository.OrderRepository;
import shoppingcart.repository.UserRepository;
import shoppingcart.service.CartSerice;
import shoppingcart.service.OrderService;
import shoppingcart.service.ProductService;

import java.util.*;

@Service

public class OrderImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Autowired
    private CartSerice cartSerice;
    @Autowired
    private ProductService productService;



    @Override
    public Iterable<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public Optional<Order> findById(Integer id) {
        return orderRepository.findById(id);
    }

    @Override
    public Order save(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public Integer saveOder(Order order) {
        return orderRepository.save(order).getId();
    }

    @Override
    public void remove(Integer id) {
        orderRepository.deleteById(id);
    }

    @Override
    public Order makeOder(User user, Long totalPrice, HashMap<Integer, Item> carts) {
        Order order = new Order();
        order.setUser(user);
        order.setFirstName(user.getFirstName());
        order.setLastName(user.getLastName());
        order.setAddress(user.getAddress());
        order.setPhone(user.getPhone());
        order.setTotalPrice(totalPrice);
        order.setCreateDate(new java.util.Date());
        orderRepository.save(order);


        for(Map.Entry<Integer, Item> cart : carts.entrySet()) {
            OrderDetail orderDetail = new OrderDetail();
            Item item = cart.getValue();
            orderDetail.setTotal(item.getProduct().getPrice()*item.getQuantity());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setOrder(order);
            orderDetail.setProduct(item.getProduct());
            orderDetailRepository.save(orderDetail);
        }
        return order;
    }
}
