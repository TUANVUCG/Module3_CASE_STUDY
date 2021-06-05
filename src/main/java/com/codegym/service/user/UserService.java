package com.codegym.service.user;

import com.codegym.DAO.user.IUserDao;
import com.codegym.DAO.user.UserDAO;

import java.util.Map;

public class UserService implements IUserService{
    IUserDao userDao = new UserDAO();
    @Override
    public Map<String, String> findAccount() {
        return userDao.findAccount();
    }
}
