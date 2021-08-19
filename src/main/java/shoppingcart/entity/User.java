package shoppingcart.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jdk.nashorn.internal.ir.annotations.Ignore;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(unique = true,nullable = false)
    String username;
    @Column(nullable = false)
    String password;
    @Column
    Boolean active=false;
    @Column
    Boolean admin=false;
    @Column
//    @Size(min = 1, max = 45, message = "Không được bỏ trống")
    String firstName;
    @Column
//    @Size(min = 1, max = 45, message = "Không được bỏ trống")
    String lastName;
    @Column
    @DateTimeFormat(pattern="dd/MM/yyyy")
    Date birthday;
    @Column
//    @Size(min = 1, max = 45, message = "Không được bỏ trống")
    Boolean sex;
    @Column
//    @Size(min = 1, max = 45, message = "Không được bỏ trống")
    String address;
    @Column
//    @NotEmpty(message = "Sai định dạng")
//    @Pattern(regexp = "(^$|[0-9]{10})")
    String phone;
    @OneToMany(mappedBy = "user")
    private List<Rate> rateList;

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
        this.password = password;
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
}
