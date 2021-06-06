package com.codegym.controller.student;
import com.codegym.model.Classes;
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
            default:
                showStudentList(request, response);
        }
    }

    private void showFormView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String className = studentService.findClassName(id);
        request.setAttribute("className",className);

        List<Classes> classesList = studentService.findClass();
        request.setAttribute("classesList",classesList);
        Student student = studentService.findById(id);

        request.setAttribute("student",student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/view.jsp");
        dispatcher.forward(request, response);
    }


    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher;
        studentService.delete(id);
        response.sendRedirect("/students");
    }


    private void showStudentList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classes> classesList = studentService.findClass();
        request.setAttribute("classesList",classesList);
        List<Integer> classIdList = studentService.findClassId();
        request.setAttribute("classIdList",classIdList);
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
        List<Classes> classesList = studentService.findClass();
        request.setAttribute("classesList",classesList);

        int id = Integer.parseInt(request.getParameter("id"));
        Student studentUpdate = studentService.findById(id);
        request.setAttribute("studentUpdate",studentUpdate);

        List<Integer> classNameList = studentService.findClassId();
        request.setAttribute("classNameList",classNameList);

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateOfBirth = request.getParameter("dateOfBirth");
        int classId = Integer.parseInt(request.getParameter("classId"));
        String image = request.getParameter("image");
        float practice = Float.parseFloat(request.getParameter("practice"));
        float theory = Float.parseFloat(request.getParameter("theory"));
        Student student2 = new Student(name, address, email, phoneNumber, dateOfBirth, classId,image,practice,theory);
        studentService.update(id,student2);
        response.sendRedirect("/students");
    }

    private void createNewStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Integer> classNameList = studentService.findClassId();
        request.setAttribute("classNameList",classNameList);
        List<Classes> classesList = studentService.findClass();
        request.setAttribute("classesList",classesList);
        if (name != "") {
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            int classId = Integer.parseInt(request.getParameter("classId"));
            String image = request.getParameter("image");
            float practice = Float.parseFloat(request.getParameter("practice"));
            float theory = Float.parseFloat(request.getParameter("theory"));
            Student student = new Student(name, address, email, phoneNumber, dateOfBirth, classId,image,practice,theory);
            studentService.create(student);
            response.sendRedirect("/students");
        }
    }
}
