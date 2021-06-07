package com.codegym.service.user;

import com.codegym.DAO.user.IUserDao;
import com.codegym.DAO.user.UserDAO;
import com.codegym.model.user.User;

import java.util.List;


public class UserService implements IUserService{
    IUserDao userDao = new UserDAO();
    @Override
    public List<User> findUser() {
        return userDao.findUser();
    }

    @Override
    public boolean create(User user) {
        return userDao.createUser(user);
    }
}
