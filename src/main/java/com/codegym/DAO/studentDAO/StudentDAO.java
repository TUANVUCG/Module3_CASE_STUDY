package com.codegym.DAO.studentDAO;

import com.codegym.DAO.SQLConnection;
import com.codegym.model.Classes;
import com.codegym.model.student.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements IStudentDAO {
    public static final String SELECT_ALL_STUDENT = "select * from student";
    public static final String CREATE_NEW_STUDENT = "call createNewStudent(?,?,?,?,?,?,?,?,?)";
    public static final String DELETE_STUDENT_BY_ID = "call removeStudentById(?)";
    public static final String UPDATE_STUDENT_BY_ID = "call updateStudentById(?,?,?,?,?,?,?,?,?,?)";
    public static final String FIND_STUDENT_BY_NAME = "call findStudentName(?)";
    public static final String FIND_STUDENT_BY_ID ="select * from student where studentId = ?";
    public static final String FIND_CLASS_NAME_BY_CLASS_ID = "select className from class where classId = ?";
    public static final String FIND_CLASS_ID = "select classId from class";
    public static final String FIND_CLASS = "select * from class";


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
        Student student = new Student();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_STUDENT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phoneNumber");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                int classId = resultSet.getInt("classId");
                String image = resultSet.getString("image");
                float practice = resultSet.getFloat("practice");
                float theory = resultSet.getFloat("theory");
                student = new Student(name,address,email,phoneNumber,dateOfBirth,classId,image,practice,theory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
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
                Student student = new Student(id,name1, address, email, phoneNumber, dateOfBirth, classId,image,practice,theory);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }


    @Override
    public List<Integer> findClassId(){
        List<Integer> classNameList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_CLASS_ID);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                classNameList.add(Integer.parseInt(resultSet.getString("classId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classNameList;
    }

    @Override
    public List<Classes> findClass() {
        List<Classes> classesList = new ArrayList<>();
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_CLASS);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int classId = resultSet.getInt("classId");
                String className = resultSet.getString("className");
                Classes classes = new Classes(classId,className);
                classesList.add(classes);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classesList;
    }

    @Override
    public String findClassName(int classId) {
        String className = null;
        Connection connection = SQLConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_CLASS_NAME_BY_CLASS_ID);
            ps.setInt(1,classId);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                className = resultSet.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return className;
    }

    public static void main(String[] args) {
        StudentDAO studentDAO = new StudentDAO();
        System.out.println(studentDAO.findClassName(1));
    }
}
