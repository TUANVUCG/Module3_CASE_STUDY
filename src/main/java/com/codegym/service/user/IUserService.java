package com.codegym.service.user;

import com.codegym.model.user.User;

import java.util.List;

public interface IUserService {
    List<User> findUser();
    boolean create(User user);
}
