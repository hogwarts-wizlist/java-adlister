package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;

import java.util.List;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private String firstname;
    private String lastname;
    private String biography;
    private String profile_pic;
    private String created_at;
    private String updated_at;



    public List<Ad> getAds() {
        return ads;
    }

    public void setAds(List<Ad> ads) {
        this.ads = ads;
    }

    private List<Ad> ads;

    public User(long id, String username, String email, String password, String firstname, String lastname, String biography, String profile_pic, String created_at, String updated_at, List<Ad> ads) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.biography = biography;
        this.profile_pic = profile_pic;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.ads = ads;
    }

    public User() {}

    public User(String username, String email, String password, String profile_pic) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.profile_pic = profile_pic;
    }

    public User(long id, String username, String email, String password, String firstname, String lastname, String biography, String profile_pic, String created_at, String updated_at) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.biography = biography;
        this.profile_pic = profile_pic;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = Password.hash(password);
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getbiography() {
        return biography;
    }

    public void setbiography(String biography) {
        this.biography = biography;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
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

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }
}
