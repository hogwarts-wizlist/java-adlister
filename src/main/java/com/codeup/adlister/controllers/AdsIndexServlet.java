package com.codeup.adlister.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdsIndexServlet" , urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve the adsindex.jsp
        request.getRequestDispatcher("WEB-INF/ads/ads_index.jsp").forward(request, response);
    }
}
