package shoppingcart.security;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        System.out.println("here");
        System.out.println(httpServletRequest.getMethod());
        System.out.println(e.getMessage());
        //httpServletResponse.sendRedirect("errorPage.jsp");
        httpServletRequest.getRequestDispatcher("/WEB-INF/views/errorPage.jsp").forward(httpServletRequest,httpServletResponse);
        //httpServletResponse.sendError(403,"fuck u");
        //httpServletResponse.sendRedirect("http://localhost:8080/errorPage");
    }
}