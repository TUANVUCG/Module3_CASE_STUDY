package com.codegym.service.student;

import com.codegym.DAO.studentDAO.IStudentDAO;
import com.codegym.DAO.studentDAO.StudentDAO;
import com.codegym.model.Classes;
import com.codegym.model.student.Student;

import java.util.List;

public class StudentService implements IStudentService{
    private IStudentDAO studentDAO = new StudentDAO();
    @Override
    public List<Student> findAll() {
        return studentDAO.findAll();
    }

    @Override
    public Student findById(int id) {
        return studentDAO.findById(id);
    }

    @Override
    public boolean create(Student student) {
        return studentDAO.create(student);
    }

    @Override
    public boolean update(int id, Student student) {
        return studentDAO.update(id,student);
    }

    @Override
    public boolean delete(int id) {
        return studentDAO.delete(id);
    }

    @Override
    public List<Student> findStudentByName(String name) {
        return studentDAO.findStudentByName(name);
    }

    @Override
    public List<Integer> findClassId() {
        return studentDAO.findClassId();
    }

    @Override
    public List<Classes> findClass() {
        return studentDAO.findClass();
    }

    @Override
    public String findClassName(int classId) {
        return studentDAO.findClassName(classId);
    }
}
