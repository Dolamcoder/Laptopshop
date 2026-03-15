package com.example.Laptopshop.service;

import com.example.Laptopshop.domain.User;
import com.example.Laptopshop.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;
    public UserService(UserRepository userRepository){
        this.userRepository=userRepository;
    }
    public List<User> getAllUser(){
         return this.userRepository.findAll();
    }
    public User handleCreateUser(User user){
        return this.userRepository.save(user);
    }
}
