package shoppingcart.entity;

import org.hibernate.validator.constraints.Length;
import shoppingcart.security.EncryptMD5;

import javax.persistence.*;
import javax.validation.constraints.*;
//import com.fasterxml.jackson.annotation.JsonIgnore;
//import jdk.nashorn.internal.ir.annotations.Ignore;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(unique = true)
    @Pattern(regexp = "[a-zA-Z0-9]+", message = "Username must not contain special characters")
    String username;
    @Column
    @Email
    String email;
    @Column(nullable = true)
    @Length(min = 6, message = "Password at least 6 characters")
    String password;
    @Column
    Boolean active = false;
    @Column
    Boolean admin = false;
    @Column
    @Size(min = 1, max = 45, message = "Not be empty ")
    @Pattern(regexp = "^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹý ]+$",
            message = "Not contain special characters and numbers")
    String firstName;
    @Column
    @Size(min = 1, max = 45, message = "Not be empty ")
    @Pattern(regexp = "^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹý ]+$",
            message = "Not contain special characters and numbers")
    String lastName;
    @Column
    @DateTimeFormat(pattern="mm/dd/yyyy")
    Date birthday;
    @Column
    Boolean sex;
    @Column
    @Size(min = 1, max = 45, message = "Not be empty ")
    String address;
    @Column
    @NotEmpty(message = "Not be empty ")
    @Pattern(regexp = "(84|0[3|9])+([0-9]{8})\\b", message = "Wrong Format Number Phone")
//    @Pattern(regexp = "(^$|[0-9]{10})")
    String phone;
    @OneToMany(mappedBy = "user")
    private List<Rate> rateList;

    @OneToMany(mappedBy = "user")
    private List<Review> reviews;

    private boolean block=false;

    public boolean isBlock() {
        return block;
    }

    public void setBlock(boolean block) {
        this.block = block;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = EncryptMD5.EncryptedToMD5(password);
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

    public String getBirthday(Integer integer) {
        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        if (birthday!=null)
            return formatter.format(birthday);
        else return formatter.format(new Date());
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
