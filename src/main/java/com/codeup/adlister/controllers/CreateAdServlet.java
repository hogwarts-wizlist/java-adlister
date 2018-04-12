package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateAdServlet", urlPatterns = "/create")
public class CreateAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            PULL THE VALUES OF THE NAMES AND CREATE A NEW AD OBJECT
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        User user = (User) request.getSession().getAttribute("user");

        Ad newAd = new Ad(
            1,
                title,
                description,
                price
        );
        DaoFactory.getAdsDao().insert(newAd, user.getId());
        response.sendRedirect("/ads");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve CreateAD
        request.getRequestDispatcher("WEB-INF/ads/create_ad.jsp").forward(request, response);
    }
}
