package com.codegym.service.student;

import com.codegym.model.Classes;
import com.codegym.model.student.Student;
import com.codegym.service.IGeneralService;

import java.util.List;

public interface IStudentService extends IGeneralService<Student> {
    List<Student> findStudentByName(String name);

    public List<Integer> findClassId();

    List<Classes> findClass();

    String findClassName(int classId);


}
