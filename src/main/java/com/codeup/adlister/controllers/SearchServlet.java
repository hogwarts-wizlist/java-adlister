package com.codeup.adlister.controllers;

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

@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Pulls the search attribute

    }
//
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Ad> ads = DaoFactory.getAdsDao().adBySearch(searchQuery);
        if (searchQuery != null){
            for (Ad a : ads){
                List<Category> cats = DaoFactory.getCategoriesDao().assignCatsToAd(a.getId());
                a.setCategories(cats);
            }

            request.setAttribute("ads", ads);
            request.getRequestDispatcher("WEB-INF/ads/ads_index.jsp").forward(request, response);
        } else {
            response.sendRedirect("/ads");
            return;
        }
    }
}
