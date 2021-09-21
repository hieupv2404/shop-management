package shoppingcart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;
import org.springframework.web.socket.messaging.SessionUnsubscribeEvent;
import org.springframework.web.util.HtmlUtils;
import shoppingcart.controller.AdminController;
import shoppingcart.controller.WebController;
import shoppingcart.entity.Greeting;
import shoppingcart.repository.UserRepository;

import java.util.Objects;

@Controller
@Component
public class WebSocketEventListener {
    @Autowired
    private SimpMessagingTemplate template;
    @Autowired
    private UserRepository userRepository;

    @EventListener
    public void handleSessionDisconnect(SessionDisconnectEvent event) {
        if (event.getUser()!=null) {
            if (userRepository.findByUsernameAndAdmin(event.getUser().getName(), true) != null) {
                WebController.adminActive = false;
                template.convertAndSend("/app/say/info", new Greeting("offline"));
            }
        }
    }

    @EventListener
    public void handleSessionDisconnect(SessionUnsubscribeEvent event) {
        WebController.adminActive=false;
        template.convertAndSend("/app/say/info", new Greeting("offline"));
    }
}
