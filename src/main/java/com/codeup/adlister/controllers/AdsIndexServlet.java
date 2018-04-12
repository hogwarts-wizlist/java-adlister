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
        for (Ad a : DaoFactory.getAdsDao().all()){
            List<Category> cats = DaoFactory.getCategoriesDao().assignCatsToAd(a.getId());
//            for (Category c : cats){
//                System.out.println("c.getTitle() = " + c.getTitle());
//            }
            a.setCategories(cats);
        }

        for (Ad a : DaoFactory.getAdsDao().all()){
//            List<Category> cats = DaoFactory.getCategoriesDao().assignCatsToAd(a.getId());
            for (Category c : a.getCategories()){
                System.out.println("c.getTitle() = " + c.getTitle());
            }
        }
//        Show all ads
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
//  Adding some text
//        Serve the adsindex.jsp
        request.getRequestDispatcher("WEB-INF/ads/ads_index.jsp").forward(request, response);
    }
}
