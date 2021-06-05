package com.codegym.DAO.user;

import com.codegym.DAO.SQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class UserDAO implements IUserDao{
    public static final String SELECT_ACCOUNT = "select userName,password from user";

    @Override
    public Map<String,String> findAccount() {
        Map<String,String> account = new HashMap<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                account.put(resultSet.getString(1),resultSet.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
}
