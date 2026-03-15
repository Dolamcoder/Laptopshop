package com.example.Laptopshop.service;

import com.example.Laptopshop.domain.Role;
import com.example.Laptopshop.repository.RoleRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    private final RoleRepository roleRepository;
    public RoleService(RoleRepository roleRepository){
        this.roleRepository=roleRepository;
    }
    public List<Role> getAllRole(){
        return this.roleRepository.findAll();
    }
}
