package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Categories;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdsIndexServlet" , urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ad> ads = DaoFactory.getAdsDao().all();
        for (Ad a : ads){
            List<Category> cats = DaoFactory.getCategoriesDao().assignCatsToAd(a.getId());
            a.setCategories(cats);
        }
//        Show all ads
        request.setAttribute("ads", ads);
//  Adding some text
//        Serve the adsindex.jsp
        request.getRequestDispatcher("WEB-INF/ads/ads_index.jsp").forward(request, response);
    }
}
