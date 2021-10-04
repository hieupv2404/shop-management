package shoppingcart.DTO;


import java.util.Date;


public class UserDto {
    Integer id;
    String username;
    String email;
    Boolean active = false;
    Boolean admin = false;
    String firstName;
    String lastName;
    Date birthday;
    Boolean sex;
    String address;
//    @Pattern(regexp = "(^$|[0-9]{10})")
    String phone;
    boolean block=false;

    public UserDto() {
    }

    public UserDto(shoppingcart.entity.User user){
        this.id=user.getId();
        this.username= user.getUsername();
        this.email=user.getEmail();
        this.active=user.getActive();
        this.admin=user.getAdmin();
        this.firstName=user.getFirstName();
        this.lastName=user.getLastName();
        this.birthday=user.getBirthday();
        this.sex=user.getSex();
        this.address=user.getAddress();
        this.phone=user.getPhone();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isBlock() {
        return block;
    }

    public void setBlock(boolean block) {
        this.block = block;
    }
}
