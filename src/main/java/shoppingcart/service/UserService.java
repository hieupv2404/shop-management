package shoppingcart.service;

import shoppingcart.DTO.DTOUser;
import shoppingcart.entity.User;

public interface UserService extends IGeneralService<User> {

    public User updateUser(Integer id, User user);

    public User updatePassword(Integer id, User user, String oldPassword);

}
