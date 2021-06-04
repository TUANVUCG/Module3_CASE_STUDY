package com.codegym.controller.teacher;

import com.codegym.model.teacher.Teacher;
import com.codegym.service.teacher.TeacherService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TeacherServlet", value = "/teachers")
public class TeacherServlet extends HttpServlet {
    TeacherService teacherService = new TeacherService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            case "delete":
                deleteTeacher(request,response);
                break;
            default:
                showListTeacher(request, response);
                break;
        }
    }



    private void deleteTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        teacherService.delete(id);
        response.sendRedirect("/teachers");
    }
//    private void findTeacherByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("find");
//        List<Teacher> teacherList = new ArrayList<>();
//        teacherList = teacherService.findTeacherByName(name);
//        request.setAttribute("teachers",teacherList);
//        response.sendRedirect("/teachers");
//    }
    private void editTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String quere = request.getParameter("name");
        if (quere != ""){
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            Teacher teacher = new Teacher(name,address,email,phoneNumber,dateOfBirth);
            teacherService.update(id,teacher);
            response.sendRedirect("/teachers");
        }

    }
    private void createTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String quere = request.getParameter("name");
            if (quere != ""){
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String dateOfBirth = request.getParameter("dateOfBirth");
                Teacher teacher = new Teacher(name,address,email,phoneNumber,dateOfBirth);
                teacherService.create(teacher);
                response.sendRedirect("/teachers");
            }
    }


    private void showListTeacher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> teacherList = new ArrayList<>();
        String query = request.getParameter("find");
        if (query == "" || query == null){
            teacherList = teacherService.findAll();
        } else {
            teacherList = teacherService.findTeacherByName(query);
        }
        request.setAttribute("teachers",teacherList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/teacher/list.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action) {
            case "create":
                createTeacher(request,response);
                break;
            case "edit":
                editTeacher(request,response);
                break;
            case "find":
                break;
            default:
                showListTeacher(request,response);
                break;
        }
    }
}
