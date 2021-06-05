package com.codegym.DAO.studentDAO;

import com.codegym.DAO.SQLConnection;
import com.codegym.model.student.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentDAO implements IStudentDAO {
    public static final String SELECT_ALL_STUDENT = "select * from student";
    public static final String CREATE_NEW_STUDENT = "call createNewStudent(?,?,?,?,?,?,?,?,?)";
    public static final String DELETE_STUDENT_BY_ID = "call removeStudentById(?)";
    public static final String UPDATE_STUDENT_BY_ID = "call updateStudentById(?,?,?,?,?,?,?,?,?,?)";
    public static final String FIND_STUDENT_BY_NAME = "call findStudentName(?)";
    public static final String FIND_LIST_CLASS_ID = "call findClassId";
    public static final String FIND_LIST_CLASS_NAME = "call findClassName";

    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("studentId");
                String name = resultSet.getString("name");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                int classId = resultSet.getInt("classId");
                String image = resultSet.getString("image");
                float practice = resultSet.getFloat("practice");
                float theory = resultSet.getFloat("theory");
                Student student = new Student(id,name,address,email,phoneNumber,dateOfBirth,classId,image,practice,theory);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public boolean create(Student student) {
        Connection connection = SQLConnection.getConnection();
        int rowInserted = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(CREATE_NEW_STUDENT);
            callableStatement.setString(1, student.getName());
            callableStatement.setString(2, student.getAddress());
            callableStatement.setString(3, student.getEmail());
            callableStatement.setString(4, student.getPhoneNumber());
            callableStatement.setString(5, student.getdOB());
            callableStatement.setInt(6, student.getClassId());
            callableStatement.setString(7,student.getImage());
            callableStatement.setFloat(8,student.getPractice());
            callableStatement.setFloat(9,student.getTheory());
            rowInserted = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted != 0;
    }

    @Override
    public boolean update(int id, Student student) {
        Connection connection = SQLConnection.getConnection();
        int rowUpdate = 0;
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_STUDENT_BY_ID);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, student.getName());
            callableStatement.setString(3, student.getAddress());
            callableStatement.setString(4, student.getEmail());
            callableStatement.setString(5, student.getPhoneNumber());
            callableStatement.setString(6, student.getdOB());
            callableStatement.setInt(7, student.getClassId());
            callableStatement.setString(8,student.getImage());
            callableStatement.setFloat(9,student.getPractice());
            callableStatement.setFloat(10,student.getTheory());
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
            CallableStatement callableStatement = connection.prepareCall(DELETE_STUDENT_BY_ID);
            callableStatement.setInt(1, id);
            rowDelete = callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete != 0;
    }

    @Override
    public List<Student> findStudentByName(String name) {
        List<Student> studentList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_STUDENT_BY_NAME);
            callableStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("studentId");
                String name1 = resultSet.getString("name");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                int classId = resultSet.getInt("classId");
                String image = resultSet.getString("image");
                float practice = resultSet.getFloat("practice");
                float theory = resultSet.getFloat("theory");
                Student student = new Student(name1, address, email, phoneNumber, dateOfBirth, classId,image,practice,theory);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    public Map<Integer,String> findClass() {
        Map<Integer,String> classIdList = new HashMap<>();
        Connection connection = SQLConnection.getConnection();
        try {
            CallableStatement callableStatementId = connection.prepareCall(FIND_LIST_CLASS_ID);
            ResultSet resultSetId = callableStatementId.executeQuery();
            CallableStatement callableStatementName = connection.prepareCall(FIND_LIST_CLASS_NAME);
            ResultSet resultSetName = callableStatementName.executeQuery();
            while (resultSetId.next()) {
                classIdList.put(resultSetId.getInt(1),resultSetName.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classIdList;
    }
}
