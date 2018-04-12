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

@WebServlet(name = "IndividualAdServlet", urlPatterns = "/ad")
public class IndividualAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve Individual Ad
        String id = request.getParameter("id");
        Ad ad = DaoFactory.getAdsDao().single(id);
        List<Category> cats = DaoFactory.getCategoriesDao().assignCatsToAd(ad.getId());
        ad.setCategories(cats);

        request.setAttribute("ad", ad);
        request.getRequestDispatcher("WEB-INF/ads/ind_ad.jsp").forward(request, response);
    }
}
