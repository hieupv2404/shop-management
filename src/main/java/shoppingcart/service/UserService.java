package shoppingcart.service;

import shoppingcart.DTO.ChangePasswordDto;
import shoppingcart.entity.User;

public interface UserService extends IGeneralService<User> {

    public User updateUser( Integer id,User user);

    public User updatePassword(ChangePasswordDto changePasswordDto);

}
