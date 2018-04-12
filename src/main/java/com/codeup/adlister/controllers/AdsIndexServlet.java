package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdsIndexServlet" , urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for (Ad a : DaoFactory.getAdsDao().all()){
            a.setCategories(DaoFactory.getCategoriesDao().assignCatsToAd());
        }
//        Show all ads
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
//  Adding some text
//        Serve the adsindex.jsp
        request.getRequestDispatcher("WEB-INF/ads/ads_index.jsp").forward(request, response);
    }
}
