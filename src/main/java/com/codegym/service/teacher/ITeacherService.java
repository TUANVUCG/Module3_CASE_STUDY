package com.codegym.service.teacher;

import com.codegym.model.teacher.Teacher;
import com.codegym.service.IGeneralService;

import java.util.List;

public interface ITeacherService extends IGeneralService<Teacher> {
    List<Teacher> findTeacherByName(String name);
}
