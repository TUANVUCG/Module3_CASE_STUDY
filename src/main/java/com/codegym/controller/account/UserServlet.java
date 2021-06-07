package com.codegym.controller.account;

import com.codegym.model.user.User;
import com.codegym.service.user.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "registration":
                registration(request, response);
                break;
            default:
                break;
        }
    }

    private void registration(HttpServletRequest request, HttpServletResponse response) {
        try {
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("re-password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            List<User> userList = userService.findUser();
            for (User user : userList) {
                if (account.equals(user.getUserName())) {
                    request.setAttribute("message3", "Account already exists");
                    err(request,response,"register");
                    break;
                } else if (!password.equals(rePassword)) {
                    request.setAttribute("message4", "Password is not the same");
                    err(request,response,"register");
                    break;
                } else if (email.equals(user.getEmail())) {
                    request.setAttribute("message5", "Email already exists");
                    err(request,response,"register");
                    break;
                } else if (phone.equals(user.getPhoneNumber())) {
                    request.setAttribute("message6", "Phone already exists");
                    err(request,response,"register");
                    break;
                }
            }
            userService.create(new User(account, password, email, phone, role));
            if (role.equals("teacher")) {
                response.sendRedirect("/teachers");
            } else if (role.equals("student")) {
                response.sendRedirect("/students");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void err(HttpServletRequest request, HttpServletResponse response, String form){
        request.setAttribute("form", form);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void login(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.findUser();
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        try {
            int checkAccount = 0;
            for (User user : userList) {
                if (user.getUserName().equals(account) && user.getPassword().equals(password)) {
                    if (user.getRole().equals("teacher")) {
                        response.sendRedirect("/teachers");
                        break;
                    } else if (user.getRole().equals("student")) {
                        response.sendRedirect("/students");
                        break;
                    }
                }
                if (user.getUserName().equals(account)) {
                    checkAccount++;
                }
            }

            if (checkAccount == 0) {
                request.setAttribute("message", "Account does not exist");
                err(request,response,"logins");
            } else if (checkAccount > 0) {
                request.setAttribute("message2", "Incorrect password");
                err(request,response,"logins");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
