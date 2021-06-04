package com.codegym.DAO.teacherDAO;

import com.codegym.DAO.IGeneralDAO;
import com.codegym.model.teacher.Teacher;

import java.util.List;

public interface ITeacherDAO extends IGeneralDAO<Teacher> {
    List<Teacher> findTeacherByName(String name);
}
