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
                stmt = connection.prepareStatement("SELECT a.id, u.username, c.title FROM ads a JOIN users u ON a.user_id = u.id JOIN ad_cat ac ON ac.ad_id = a.id JOIN categories c ON ac.cat_id = c.id");
                ResultSet rs = stmt.executeQuery();
                return createAdsFromResults(rs);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                throw new RuntimeException("Error retrieving all ads.", e);
            }
        }

    @Override
        public Long insert (Ad ad) {
            try {
                String insertQuery = "INSERT INTO ads(user_id, title, description, price) VALUES (?,?,?,?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, 1);
                stmt.setString(2, ad.getTitle());
                stmt.setString(3, ad.getDescription());
                stmt.setDouble(4, ad.getPrice());
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                return rs.getLong(1);
            } catch (SQLException e) {
                throw new RuntimeException("Error creating a new ad.", e);
            }
        }

    @Override
    public Ad single(String id) {
        String query = "SELECT a.*, u.username FROM ads a JOIN users u ON u.id = a.user_id WHERE a.id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException("Problem with single ad ", e);
        }

    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getDouble("price"),
                rs.getString("created_at"),
                rs.getString("updated_at"),
                rs.getString("username"),
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
