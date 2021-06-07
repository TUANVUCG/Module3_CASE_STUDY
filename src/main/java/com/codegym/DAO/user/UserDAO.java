package com.codegym.DAO.user;

import com.codegym.DAO.SQLConnection;
import com.codegym.model.user.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDAO implements IUserDao {
    public static final String SELECT_ACCOUNT = "select userName,password,role,email,phoneNumber from user";
    public static final String CREATE_USER = "call createUser(?,?,?,?,?)";
    public static final String EDIT_USER = "call editUser(?,?,?,?)";

    @Override
    public List<User> findUser() {
        List<User> userList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String userName = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String role = resultSet.getString("role");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");
                userList.add(new User(userName, password, role,email,phoneNumber));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean createUser(User user) {
        Connection connection = SQLConnection.getConnection();
        int rowInsert = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(CREATE_USER);
            callableStatement.setString(1,user.getUserName());
            callableStatement.setString(2, user.getPassword());
            callableStatement.setString(3, user.getRole());
            callableStatement.setString(4, user.getEmail());
            callableStatement.setString(5,user.getPhoneNumber());

            rowInsert = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInsert != 0;
    }

    @Override
    public boolean editUser(User user) {
        Connection connection = SQLConnection.getConnection();
        int rowInsert = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_USER);
            callableStatement.setString(1,user.getUserName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3,user.getPhoneNumber());
            callableStatement.setString(4,user.getPassword());
            rowInsert = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInsert != 0;
    }
}
