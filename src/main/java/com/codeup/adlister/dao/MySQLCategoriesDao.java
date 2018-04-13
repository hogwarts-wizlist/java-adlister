package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;
import org.omg.SendingContext.RunTime;

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

//    public Category buildCategory(long cat_id){
//        return new Category( cat_id, );
//    }

    @Override
    public List<Category> all() {
        PreparedStatement stmt = null;
        try {
        stmt = connection.prepareStatement("SELECT * FROM categories");
        ResultSet rs = stmt.executeQuery();
        return createCatFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all categories");
        }
    }

    private Category extractCategory(ResultSet rs) throws SQLException{
        return new Category(
                rs.getLong("id"),
                rs.getString("title")
        );
    }

    private List<Category> createCatFromResults(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(extractCategory(rs));
        }
        return categories;
    }

    public List<Category> assignCatsToAd(long id){

        String query = "SELECT c.* FROM ads a JOIN ad_cat ac ON ac.ad_id = a.id JOIN categories c ON ac.cat_id = c.id WHERE a.id = ?;";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return createCatFromResults(rs);
        }catch (SQLException e){
            throw new RuntimeException("failed to add cats to list", e);
        }


    }

    @Override
    public void insert(long ad_id, long cat_id) {
        String query ="INSERT INTO ad_cat(ad_id, cat_id) VALUES(?,?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setLong(1, ad_id);
            ps.setLong(2, cat_id);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
        } catch (SQLException e) {
            System.out.println("e.getMessage() = " + e.getMessage());
            throw new RuntimeException("error adding category to ad_cat", e);
        }
    }

}
