package com.example.Laptopshop.service;

import com.example.Laptopshop.domain.User;
import com.example.Laptopshop.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    public UserService(UserRepository userRepository){
        this.userRepository=userRepository;
    }
    public List<User> getAllUser(){
         return this.userRepository.findAll();
    }
    public User getUserById(Long userId){
        Optional<User> userOptional=this.userRepository.findById(userId);
        User user=userOptional.isPresent() ? userOptional.get():null;
        return user;
    }
    public User handleCreateUser(User user){
        return this.userRepository.save(user);
    }
}
