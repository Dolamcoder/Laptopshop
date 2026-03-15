package com.example.Laptopshop.controller.admin;

import com.example.Laptopshop.domain.User;
import com.example.Laptopshop.service.RoleService;
import com.example.Laptopshop.service.UploadFileService;
import com.example.Laptopshop.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    private final UserService userService;
    private final RoleService roleService;
    private final UploadFileService uploadFileService;

    public UserController(UserService userService, RoleService roleService, UploadFileService uploadFileService) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadFileService=uploadFileService;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        System.out.println("List User" + this.userService.getAllUser());
        model.addAttribute("users", this.userService.getAllUser());
        return "admin/user/index";
    }
    
    @GetMapping("admin/user/create")
    public String getCreateUserForm(Model model) {
        model.addAttribute("roles", this.roleService.getAllRole());
        model.addAttribute("user", new User());
        return "admin/user/createUser";
    }
    @PostMapping("/admin/user")
    public String createUser(@ModelAttribute("user") User user, @RequestParam("lamhello") MultipartFile file) {
        String avatarUrl=this.uploadFileService.handleUploadFile(file, "avatar");
        user.setAvatar(avatarUrl);
        this.userService.handleCreateUser(user);
        return "redirect:/admin/user";
    }
}
