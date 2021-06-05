package com.codegym.controller.student;
import com.codegym.model.student.Student;
import com.codegym.service.student.IStudentService;
import com.codegym.service.student.StudentService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/students")
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteStudent(request,response);
                break;
            case "view":
                showFormView(request,response);
                break;
            default:
                showStudentList(request, response);
        }
    }

<<<<<<< HEAD
    private void showFormView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
>>>>>>> 6bb8eed6a11f1b8212d1feada83371eaeb01a31d
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/view.jsp");
        dispatcher.forward(request,response);
    }


    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher;
        studentService.delete(id);
        response.sendRedirect("/students");
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/create.jsp");
        dispatcher.forward(request, response);

    }

    private void showStudentList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Integer> st
        String query = request.getParameter("search");
        List<Student> studentList;
        if(query==null||query.equals("")){
            studentList = studentService.findAll();
        }
        else{
            studentList = studentService.findStudentByName(query);
        }
        request.setAttribute("studentList", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewStudent(request, response);
                break;
            case "update":
                updateStudent(request,response);
                break;
            default:
                showStudentList(request, response);
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int classId = Integer.parseInt(request.getParameter("classId"));
        Student student = new Student(name, address, email, phoneNumber, dateOfBirth, classId);
        studentService.update(id,student);
//        request.setAttribute("student",student);
        response.sendRedirect("/students");
    }

    private void createNewStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        if (name != "") {
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            int classId = Integer.parseInt(request.getParameter("classId"));
            Student student = new Student(name, address, email, phoneNumber, dateOfBirth, classId);
            studentService.create(student);
            response.sendRedirect("/students");
        }
    }
}
