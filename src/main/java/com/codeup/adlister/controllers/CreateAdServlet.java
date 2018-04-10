package com.codeup.adlister.controllers;

import com.codeup.adlister.models.Ad;

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
//                this.id = id;
//        this.userId = userId;
//        this.title = title;
//        this.description = description;
//        this.price = price;
//        this.low_price = low_price;
//        this.high_price = high_price;
//        this.created_at = created_at;
//        this.updated_at = updated_at;
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double low_price = Double.parseDouble(request.getParameter("low_price"));
        double high_price = Double.parseDouble(request.getParameter("high_price"));
        String ad_image = request.getParameter("high_price");
        Ad newAd = new Ad(
                1,
                1,
                title,
                description,
                price,
                low_price,
                high_price,
                ad_image
        );
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve CreateAD
        request.getRequestDispatcher("WEB-INF/ads/create_ad.jsp").forward(request, response);
    }
}
