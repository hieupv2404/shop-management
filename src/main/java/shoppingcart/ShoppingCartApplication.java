package shoppingcart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import java.util.Currency;
import java.util.Date;

@SpringBootApplication
public class ShoppingCartApplication extends SpringBootServletInitializer{

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ShoppingCartApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ShoppingCartApplication.class, args);
        System.out.println(java.time.LocalDate.now());


    }

}
