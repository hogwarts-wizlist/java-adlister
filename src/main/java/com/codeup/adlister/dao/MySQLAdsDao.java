package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

        @Override
        public List<Ad> all () {
            java.sql.PreparedStatement stmt = null;
            try {
                stmt = connection.prepareStatement("SELECT * FROM ads");
                ResultSet rs = stmt.executeQuery();
                return createAdsFromResults(rs);
            } catch (SQLException e) {
                throw new RuntimeException("Error retrieving all ads.", e);

            }
        }

        @Override
        public Long insert (Ad ad) {
            try {
                String insertQuery = "INSERT INTO ads(user_id, title, description, price, low_price, high_price, created_at, updated_at) VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, ad.getUserId());
                stmt.setString(2, ad.getTitle());
                stmt.setString(3, ad.getDescription());
                stmt.setDouble(4, ad.getPrice());
                stmt.setDouble(5, ad.getLow_price());
                stmt.setDouble(6, ad.getHigh_price());
            } catch (SQLException e) {
                e.printStackTrace();
            }


        }
    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getDouble("price"),
                rs.getDouble("low_price"),
                rs.getDouble("high_price"),
                rs.getString("ad_image")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
