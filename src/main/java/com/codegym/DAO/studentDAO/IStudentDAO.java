package com.codegym.DAO.studentDAO;

import com.codegym.DAO.IGeneralDAO;
import com.codegym.model.student.Student;
import com.codegym.service.IGeneralService;

import java.util.List;

public interface IStudentDAO extends IGeneralDAO<Student> {
    List<Student> findStudentByName(String name);
}
