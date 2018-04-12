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

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve Login
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        request.setAttribute("username", username);
        request.setAttribute("password", password);

        User user = DaoFactory.getUsersDao().findByUsername(username);
        //            error message will not take place

//        if field is empty then attempt login again
        if (user == null) {
            response.sendRedirect("/login");
//            if username is empty, error message will occur
            if (username.equals("")) {
                request.getSession().setAttribute("errorMessage", "*Please enter valid username");
            }
            return;
        } else {
            request.getSession().removeAttribute("errorMessage");
        }


//        password confirmation for user
        boolean validAttempt = Password.check(password, user.getPassword());
//        boolean validAttempt = password.equals(user.getPassword());

//        if password matches then directed to profile and if not then retry login
        if (validAttempt) {
            request.getSession().setAttribute("user", user);
            request.getSession().removeAttribute("errorMessage");
            response.sendRedirect("/profile");
        } else {

//            if password is empty, error message will occur
            if (password.equals("")) {
                request.getSession().setAttribute("errorMessage", "*Please enter valid password");
            }

            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);

        }


    }
}
