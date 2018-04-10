package com.codeup.adlister.models;

import java.util.List;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private double price;
    private double low_price;
    private double high_price;
    private String created_at;
    private String updated_at;
    private String ad_image;
    private String rating;
    private List<String> categories;

    public Ad(long id, long userId, String title, String description, double price, double low_price, double high_price) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.low_price = low_price;
        this.high_price = high_price;
//        this.created_at = created_at;
//        this.updated_at = updated_at;
    }

    public Ad(long id, long userId, String title, String description, double aDouble, double low_price, double price, String ad_image) {

        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String title, String description, Double price, double low_price, double high_price, String ad_image) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.low_price = low_price;
        this.high_price = high_price;
        this.ad_image = ad_image;
    }

//    Used for insert method
    public Ad(long userId, String title, String description, double price, double low_price, double high_price, String created_at, String updated_at) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.low_price = low_price;
        this.high_price = high_price;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getLow_price() {
        return low_price;
    }

    public void setLow_price(double low_price) {
        this.low_price = low_price;
    }

    public double getHigh_price() {
        return high_price;
    }

    public void setHigh_price(double high_price) {
        this.high_price = high_price;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String getAd_image() {
        return ad_image;
    }

    public void setAd_image(String ad_image) {
        this.ad_image = ad_image;
    }
}
