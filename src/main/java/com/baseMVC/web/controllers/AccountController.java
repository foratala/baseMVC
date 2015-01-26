package com.baseMVC.web.controllers;

import com.baseMVC.entities.Account;
import com.baseMVC.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private AccountRepository accountRepository;

    @RequestMapping(value = "/accounts", method = RequestMethod.GET)
    public String listAccounts(ModelMap model) {
        model.addAttribute("account", new Account());
        model.addAttribute("accounts", accountRepository.findAll());
        return "account";
    }

    @RequestMapping(value = "/accounts/find", method = RequestMethod.GET)
    public String listAccounts(ModelMap model, @RequestParam("email") String email) {
        List<Account> byEmail = accountRepository.getByEmail(email);
        if (byEmail.size() > 0) {
            model.addAttribute("account", byEmail.get(0));
        } else {
            model.addAttribute("account", new Account());
        }
        model.addAttribute("accounts", accountRepository.findAll());
        return "account";
    }

    @RequestMapping(value = "/accounts/add", method = RequestMethod.POST)
    public String addAccount(@Valid @ModelAttribute("account") Account account, BindingResult result) {
        //        if (result.hasErrors()){
        //            return "account";
        //        }
        System.out.println("account = [" + account + "], result = [" + result + "]");
        accountRepository.save(account);
        return "redirect:/accounts";
    }

    @RequestMapping("/accounts/delete/{accountId}")
    public String deleteAccount(@PathVariable("accountId") Long accountId) {
        accountRepository.delete(accountRepository.findOne(accountId));
        return "redirect:/accounts";
    }

}
