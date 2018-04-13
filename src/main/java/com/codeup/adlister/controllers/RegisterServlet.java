package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve Register
        request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String url = request.getParameter("url");
        if ((url.equals("")) || (url == null)) {
            url = "https://avatarfiles.alphacoders.com/121/121391.jpg";
        }


        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        request.setAttribute("url", url);

        if (username != null && email != null && password != null && password.equals(confirmPassword) && email.contains("@") && email.contains(".")){
            User user = new User(username, email, Password.hash(password), url);
            DaoFactory.getUsersDao().insert(user);
            request.getSession().setAttribute("user", DaoFactory.getUsersDao().findByUsername(user.getUsername()));
//            error message will not take place
            request.getSession().removeAttribute("errorMessage");
            response.sendRedirect("/profile");
        } else {

//            if username is empty, error message will occur
            if (username.equals("")) {
                request.getSession().setAttribute("errorMessage", "*Please enter valid username");
            }
//            if password is empty, error message will occur
            if (password.equals("")) {
                request.getSession().setAttribute("errorMessage", "*Please enter valid password");
            }

            if (email.equals("") || !email.contains("@")) {
                request.getSession().setAttribute("errorMessage", "*Please enter valid email");
            }

            if (confirmPassword.equals("")) {
                request.getSession().setAttribute("errorMessage", "*Please confirm password");
            }

            if(!password.equals(confirmPassword)) {
                request.getSession().setAttribute("errorMessage", "*Password does not match");

            }

            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);

        }

    }
}
