package com.codegym.DAO.studentDAO;

import com.codegym.DAO.IGeneralDAO;
import com.codegym.model.Classes;
import com.codegym.model.student.Student;
import com.codegym.service.IGeneralService;

import java.util.List;
import java.util.Map;

public interface IStudentDAO extends IGeneralDAO<Student> {
    List<Student> findStudentByName(String name);

    List<Integer> findClassId();

    List<Classes> findClass();
}
