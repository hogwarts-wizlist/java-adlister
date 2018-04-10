package com.codeup.adlister.models;

import java.util.List;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private double price;
    private String created_at;
    private String updated_at;

    public Ad() {
    }

    public Ad(long userId, String title, String description, double price) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
    }

    public Ad(long userId, String title, String description, double price, String created_at) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.created_at = created_at;
    }

//    Everything
    public Ad(long id, long userId, String title, String description, double price, String created_at, String updated_at) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
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

}
