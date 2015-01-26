package com.baseMVC.repositories;

import com.baseMVC.entities.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccountRepository extends JpaRepository<Account, Long> {

    List<Account> getByEmail(String email);
}

