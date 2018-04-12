package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
    private Connection connection = null;

    public MySQLCategoriesDao(Config config){
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to database");
        }

    }

    @Override
    public List<Category> all() {
        PreparedStatement stmt = null;
        try {
        stmt = connection.prepareStatement("SELECT * FROM categories");
        ResultSet rs = stmt.executeQuery();
        return createCatFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to database");
        }
    }

    private Category extractCategory(ResultSet rs) throws SQLException{
        return new Category(
                rs.getLong("id"),
                rs.getString("title")
        );
    }

    private List<Category> createCatFromResults(ResultSet rs) throws SQLException {
        List<Category> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractCategory(rs));
        }
        return ads;
    }
}
