package shoppingcart.service;

import org.springframework.stereotype.Service;
import shoppingcart.entity.Order;
import shoppingcart.entity.OrderDetail;

import java.util.List;


public interface OrderDetailService extends IGeneralService<OrderDetail>{
    List<OrderDetail> findByOrder(Order order);
}
