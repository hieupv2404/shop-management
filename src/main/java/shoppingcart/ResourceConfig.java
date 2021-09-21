package shoppingcart;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class ResourceConfig implements WebMvcConfigurer {
    @Value("${config.upload_folder}") // = E:/fashion_shop_images/
    String UPLOAD_FOLDER; // = "${config.upload_folder}"

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) { //
        registry.addResourceHandler("uploads/**")// Luu tren web
                .addResourceLocations("file:"+UPLOAD_FOLDER); //luu tren may
    }
}
