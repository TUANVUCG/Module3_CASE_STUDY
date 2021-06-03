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
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request,response);
                break;
            case "delete":
                deleteStudent(request,response);
                break;
            default:
                showStudentList(request, response);
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/update.jsp");
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
        List<Student> studentList;
        studentList = studentService.findAll();
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
        Student student = new Student(id,name, address, email, phoneNumber, dateOfBirth, classId);
        studentService.update(id,student);
        request.setAttribute("student",student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/update.jsp");
        dispatcher.forward(request,response);
    }

    private void createNewStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int classId = Integer.parseInt(request.getParameter("classId"));
        Student student = new Student(name, address, email, phoneNumber, dateOfBirth, classId);
        studentService.create(student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/create.jsp");
        dispatcher.forward(request, response);
    }
}
