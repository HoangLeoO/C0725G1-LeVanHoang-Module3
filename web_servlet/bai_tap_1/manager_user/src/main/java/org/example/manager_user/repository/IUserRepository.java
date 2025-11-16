package org.example.manager_user.repository;

import org.example.manager_user.dto.UserDto;
import org.example.manager_user.entity.User;

import java.util.List;

public interface IUserRepository {
    List<UserDto> getAll();

    User getUserById(int id);

    boolean add(User user);

    void update(User user);

    boolean delete(int id);


}
