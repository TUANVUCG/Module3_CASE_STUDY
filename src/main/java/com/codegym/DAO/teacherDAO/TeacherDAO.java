package com.codegym.DAO.teacherDAO;

import com.codegym.DAO.SQLConnection;
import com.codegym.model.teacher.Teacher;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO implements ITeacherDAO{
    public static final String SELECT_ALL_TEACHER = "select * from teacher";
    public static final String CREATE_TEACHER = "call createNewTeacher(?,?,?,?,?,?)";
    public static final String REMOVE_TEACHER = "call removeTeacherById(?)";
    public static final String EDIT_TEACHER = "call editTeacherById(?,?,?,?,?,?)";
    public static final String FIND_TEACHER_BY_NAME = "call findTeacherByName(?)";

    @Override
    public List<Teacher> findAll() {
        List<Teacher> teacherList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TEACHER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("teacherId");
                String name = resultSet.getString("name");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                String urlImg = resultSet.getString("img");
                teacherList.add(new Teacher(id,name,address,email,phoneNumber,dateOfBirth,urlImg));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacherList;
    }

    @Override
    public Teacher findById(int id) {
        return null;
    }

    @Override
    public List<Teacher> findTeacherByName(String name) {
        Connection connection = SQLConnection.getConnection();
        List<Teacher> teacherList = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_TEACHER_BY_NAME);
            callableStatement.setString(1,"%"+ name+"%");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("teacherId");
                String address = resultSet.getString("address");
                String names = resultSet.getString("name");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                teacherList.add(new Teacher(id,names,address,email,phoneNumber,dateOfBirth));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacherList;
    }

    @Override
    public boolean create(Teacher teacher) {
        Connection connection = SQLConnection.getConnection();
        int rowInsert = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(CREATE_TEACHER);
            callableStatement.setString(1,teacher.getName());
            callableStatement.setString(2,teacher.getAddress());
            callableStatement.setString(3,teacher.getEmail());
            callableStatement.setString(4,teacher.getPhoneNumber());
            callableStatement.setString(5,teacher.getDateOfBirth());
            callableStatement.setString(6,teacher.getUrlImg());
            rowInsert = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInsert != 0;
    }

    @Override
    public boolean update(int id, Teacher teacher) {
        Connection connection = SQLConnection.getConnection();
        int rowUpdate = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_TEACHER);
            callableStatement.setInt(1,id);
            callableStatement.setString(2,teacher.getName());
            callableStatement.setString(3,teacher.getAddress());
            callableStatement.setString(4,teacher.getEmail());
            callableStatement.setString(5,teacher.getPhoneNumber());
            callableStatement.setString(6,teacher.getDateOfBirth());
            rowUpdate = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate != 0;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = SQLConnection.getConnection();
        int rowDelete = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(REMOVE_TEACHER);
            callableStatement.setInt(1, id);
            rowDelete = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete != 0;
    }
}
