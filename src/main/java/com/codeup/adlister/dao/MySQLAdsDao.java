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
            PreparedStatement ps = null;
            try {
                stmt = connection.prepareStatement("SELECT * FROM ads");
                ResultSet rs = stmt.executeQuery();
                rs.getLong(2);
                return createAdsFromResults(rs);
            } catch (SQLException e) {
                throw new RuntimeException("Error retrieving all ads.", e);
            }
        }

    @Override
    public List<Ad> getAdsByUser(long id) {
        List<Ad> adsByUser = new ArrayList<>();

        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setLong(1,id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){
                adsByUser.add(new Ad(
                        rs.getLong("id"),
                        rs.getLong("user_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("created_at"),
                        rs.getString("updated_at")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException("this did not work out");
        }
        return adsByUser;
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
        String query = "SELECT * FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new RuntimeException("Problem with single ad " , e);
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
                rs.getString("updated_at")
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
