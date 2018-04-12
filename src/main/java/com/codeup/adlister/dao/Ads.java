package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import java.util.List;

public interface Ads {
    //get list of all ads
    List<Ad> all();
    //insert new ad and return id
    Long insert(Ad ad, long user_id);
    //find single ad
    Ad single(String username);
//    user individual ads
    List<Ad> adsByUser(long id);
}
