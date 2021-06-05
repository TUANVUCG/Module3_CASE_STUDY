package com.codegym.controller.account;

import com.codegym.service.user.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

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
            default:
                break;
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> accountList = userService.findAccount();
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        boolean check = accountList.containsKey(account);
        try {
            if (check && accountList.get(account).equals(password)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/teachers");
                dispatcher.forward(request, response);
            } else {
                if (!check){
                    request.setAttribute("message", "Account does not exist");
                } else if (check && !accountList.get(account).equals(password)){
                    request.setAttribute("message2", "Incorrect password");
                }
                RequestDispatcher dispatcher= request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
