package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "PublicProfileServlet", urlPatterns = "/publicprofile")
public class PublicProfileServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            response.sendRedirect("/login");
            return;
        }

        String requestedUsername = request.getParameter("username");
        if (!user.getUsername().equals(requestedUsername)){
            User requestedUser = DaoFactory.getUsersDao().findByUsername(requestedUsername);
            request.setAttribute("user", requestedUser);
            request.getRequestDispatcher("WEB-INF/PublicProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("/profile");
            return;
        }

    }
}
