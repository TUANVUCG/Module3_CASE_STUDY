package com.codegym.service.teacher;

import com.codegym.DAO.teacherDAO.ITeacherDAO;
import com.codegym.DAO.teacherDAO.TeacherDAO;
import com.codegym.model.teacher.Teacher;

import java.util.List;

public class TeacherService implements ITeacherService{
    private ITeacherDAO teacherDAO = new TeacherDAO();
    @Override
    public List findAll() {
        return teacherDAO.findAll();
    }

    @Override
    public Teacher findById(int id) {
        return null;
    }

    @Override
    public List<Teacher> findTeacherByName(String name) {
        return teacherDAO.findTeacherByName(name);
    }

    @Override
    public boolean create(Teacher teacher) {
        return teacherDAO.create(teacher);
    }

    @Override
    public boolean update(int id,Teacher teacher) {
        return teacherDAO.update(id,teacher);
    }

    @Override
    public boolean delete(int id) {
        return teacherDAO.delete(id);
    }
}
