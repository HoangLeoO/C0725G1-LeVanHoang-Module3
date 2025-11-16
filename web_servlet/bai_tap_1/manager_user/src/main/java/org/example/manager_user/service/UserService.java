package org.example.manager_user.service;

import org.example.manager_user.dto.UserDto;
import org.example.manager_user.entity.User;
import org.example.manager_user.repository.IUserRepository;
import org.example.manager_user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<UserDto> getAll() {
        return userRepository.getAll();
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public void update(User user) {
        userRepository.update(user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }
}
