package shoppingcart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.net.URL;

@Component
public class EmailService {
    @Autowired
    private JavaMailSender emailSender;

    public void sendSimpleMessage(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);
    }

    @Autowired
    public SimpleMailMessage template;

    public void sendSimpleHtmlMessage(String to, String subject) {
        String text = String.format(template.getText());
        sendSimpleMessage(to, subject, text);
    }

    private void sendHtmlMessage(String to, String subject, String htmlBody) throws MessagingException {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(htmlBody, true);
        for (int i = 1; i < 8; i++) {
            File file = new File("..\\shopping-cart\\src\\main\\resources\\templates\\thymeleaf\\images\\image-" + i + ".png");
            helper.addInline("image_" + i + ".png", file);
        }
        emailSender.send(message);
    }

    @Autowired
    private SpringTemplateEngine thymeleafTemplateEngine;

    public void sendMessageUsingThymeleafTemplate(
            String to, String subject)
            throws MessagingException {

        Context thymeleafContext = new Context();
//        thymeleafContext.setVariables(templateModel);
        String htmlBody = thymeleafTemplateEngine.process("thymeleaf/mail.html", thymeleafContext);

        sendHtmlMessage(to, subject, htmlBody);
    }

}
