package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    //get list of all categories
    List<Category> all();
    List<Category> assignCatsToAd(long id);
    void insert(long ad_id, long cat_id);
}
