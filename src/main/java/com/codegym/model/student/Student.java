package com.codegym.model.student;

public class Student {
    private int id;
    private String name;
    private String address;
    private String email;
    private String phoneNumber;
    private String dOB;
    private int classId;
    private int userId;

    public Student() {
    }

    public Student(int id, String name, String address, String email, String phoneNumber, String dOB, int classId) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dOB = dOB;
        this.classId = classId;
    }

    public Student(String name, String address, String email, String phoneNumber, String dOB, int classId) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dOB = dOB;
        this.classId = classId;
    }

    public Student(String name, String address, String email, String phoneNumber, String dOB, int classId, int userId) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dOB = dOB;
        this.classId = classId;
        this.userId = userId;
    }

    public Student(int id, String name, String address, String email, String phoneNumber, String dOB, int classId, int userId) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dOB = dOB;
        this.classId = classId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getdOB() {
        return dOB;
    }

    public void setdOB(String dOB) {
        this.dOB = dOB;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
