package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.SessionService;

@Controller
@RequestMapping("/home")
public class LoginController {

	@Autowired
	AccountDAO dao;

	@Autowired
	SessionService session;

	@GetMapping("/login")
	public String viewlogin() {
		return "/home/login";
	}


	@PostMapping("/login")
	public String login(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			Account user = (Account) dao.getUsername(username);
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			} else {
				session.set("user", user);
				String uri = (String) session.get("security-uri");
				if (uri != null) {
					return "redirect:" + uri;
				} else {
					return "redirect:/home/index";
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "/home/login";
	}

}
