package com.codegym.DAO.user;

import com.codegym.model.user.User;

import java.util.List;


public interface IUserDao {
    List<User> findUser();
    boolean createUser(User user);
}
