package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
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
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to databse");
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password, first_name, last_name, biography, profile_pic, created_at, updated_at) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getFirstname());
            stmt.setString(5, user.getLastname());
            stmt.setString(6, user.getbiography());
            stmt.setString(7, user.getProfile_pic());
            stmt.setString(8, user.getCreated_at());
            stmt.setString(9, user.getUpdated_at());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Help something bad happened!");
        }


    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("biography"),
                rs.getString("profile_pic"),
                rs.getString("created_at"),
                rs.getString("updated_at")
        );
    }
}
