package com.codegym.model.student;

public class Student {
    private int id;
    private String name;
    private String address;
    private String email;
    private String phoneNumber;
    private String dOB;
    private int classId;
    private String image;
    private float practice;
    private float theory;

    public Student() {
    }

    public Student(String name, String address, String email, String phoneNumber, String dOB, int classId, String image, float practice, float theory) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dOB = dOB;
        this.classId = classId;
        this.image = image;
        this.practice = practice;
        this.theory = theory;
    }

    public Student(int id, String name, String address, String email, String phoneNumber, String dOB, int classId, String image, float practice, float theory) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dOB = dOB;
        this.classId = classId;
        this.image = image;
        this.practice = practice;
        this.theory = theory;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPractice() {
        return practice;
    }

    public void setPractice(float practice) {
        this.practice = practice;
    }

    public float getTheory() {
        return theory;
    }

    public void setTheory(float theory) {
        this.theory = theory;
    }
}
