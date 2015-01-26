package com.baseMVC.repositories;

import com.baseMVC.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.io.Serializable;

public interface UserRepository extends JpaRepository<User, Serializable> {
    
    User findByEmailAndPassword(String email, String password);

    User findByEmail(String email);
    
    User findById(int id);
}
