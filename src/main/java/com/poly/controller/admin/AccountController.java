package com.poly.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/admin/account")
	public String admin(Model model) {
		Account account = new Account();
		model.addAttribute("us", account);
		List<Account> list = accountDAO.findAll();
		model.addAttribute("accounts", list);
		return "/admin/account";
	}
	
	@PostMapping(value = "/admin/account/create")
	public String createAccount(Account account) {
		/*
		 * if(bindingResult.hasErrors()){ Map<String, String> errors= new HashMap<>();
		 * 
		 * bindingResult.getFieldErrors().forEach( error -> errors.put(error.getField(),
		 * error.getDefaultMessage()) );
		 * 
		 * String errorMsg= "";
		 * 
		 * for(String key: errors.keySet()){ errorMsg+= "Error in: " + key +
		 * ", because: " + errors.get(key) + "\n"; } model.addAttribute("error",
		 * errorMsg); return "/admin/account"; } else {
		 */
			accountDAO.save(account);
			return "redirect:/admin/account";
			/* } */
	}
	
	@RequestMapping("/admin/account/edit/{id}")
	public String editAccount(Model model, @PathVariable("id") Long id) {
		Account account = accountDAO.getReferenceById(id);
		model.addAttribute("us", account);
		List<Account> list = accountDAO.findAll();
		model.addAttribute("accounts", list);
		return "/admin/account";
	}
	
	@RequestMapping("/admin/account/update")
	public String updateAccount(Account account) {
		accountDAO.save(account);
		return "redirect:/admin/account/edit/" + account.getId();
	}
	
	
	
}
