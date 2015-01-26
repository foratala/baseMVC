package com.baseMVC.web.controllers;

import com.baseMVC.entities.User;
import com.baseMVC.services.UserService;
import com.baseMVC.web.config.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {

    private static UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        UserController.userService = userService;
    }

    public static User getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof SecurityUser) {
            SecurityUser user = (SecurityUser) principal;
            return user;
        }
        if (principal instanceof UserDetails) {
            String email = ((UserDetails) principal).getUsername();
            User loginUser = userService.findByEmail(email);
            return new SecurityUser(loginUser);
        }

        return null;
    }
}
