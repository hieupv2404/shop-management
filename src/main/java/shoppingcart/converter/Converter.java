package shoppingcart.converter;

import org.springframework.stereotype.Component;
import shoppingcart.DTO.CartDtoProductUser;
import shoppingcart.entity.Cart;

@Component
public class Converter {
    public Cart toCart(CartDtoProductUser cartDtoProductUser) {
        Cart cart = new Cart();
        cart.setAmount(cartDtoProductUser.getAmount());
        return cart;
    }

    public CartDtoProductUser toCartDtoProductUser(Cart cart) {
        CartDtoProductUser cartDtoProductUser = new CartDtoProductUser();
        if (cart.getId() != null) {
            cartDtoProductUser.setId(cart.getId());
        }
        cartDtoProductUser.setAmount(cart.getAmount());
        return cartDtoProductUser;
    }

    public Cart toCart(CartDtoProductUser cartDtoProductUser, Cart cart) {
        cart.setAmount(cartDtoProductUser.getAmount());
        return cart;
    }
}
