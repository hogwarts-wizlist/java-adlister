package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateAdServlet", urlPatterns = "/create")
public class CreateAdServlet extends HttpServlet {
    private String checkIfExists(String cat_id){
        if (cat_id != null){
            return cat_id;
        } else {
            return null;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            PULL THE VALUES OF THE NAMES AND CREATE A NEW AD OBJECT
        String title = request.getParameter("title");
        String description = request.getParameter("description");


        String c1 = checkIfExists(request.getParameter("c1"));
        String c2 = checkIfExists(request.getParameter("c2"));
        String c3 = checkIfExists(request.getParameter("c3"));
        String c4 = checkIfExists(request.getParameter("c4"));
        String c5 = checkIfExists(request.getParameter("c5"));
        String c6 = checkIfExists(request.getParameter("c6"));
        String c7 = checkIfExists(request.getParameter("c7"));
        String c8 = checkIfExists(request.getParameter("c8"));
        String c9 = checkIfExists(request.getParameter("c9"));
        String c10 =checkIfExists(request.getParameter("c10"));

        ArrayList<String> uncheckedCatIds = new ArrayList<>();
        uncheckedCatIds.add(c1);
        uncheckedCatIds.add(c2);
        uncheckedCatIds.add(c3);
        uncheckedCatIds.add(c4);
        uncheckedCatIds.add(c5);
        uncheckedCatIds.add(c6);
        uncheckedCatIds.add(c7);
        uncheckedCatIds.add(c8);
        uncheckedCatIds.add(c9);
        uncheckedCatIds.add(c10);

//        List of category ids is returned
        ArrayList<Integer> catIds = new ArrayList<>();
        for (String catId : uncheckedCatIds){
            if (catId != null){
                catIds.add(Integer.parseInt(catId));
            }
        }
        double price = Double.parseDouble(request.getParameter("price"));
        User user = (User) request.getSession().getAttribute("user");

        Ad newAd = new Ad(
            user.getId(),
                title,
                description,
                price
        );


        long ad_id = DaoFactory.getAdsDao().insert(newAd, user.getId());
        for (int cat_id : catIds){
            DaoFactory.getCategoriesDao().insert(ad_id, cat_id);
        }
        response.sendRedirect("/ads");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Serve CreateAD
        request.getRequestDispatcher("WEB-INF/ads/create_ad.jsp").forward(request, response);
    }
}
