package com.poly.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.MailService;
import com.poly.util.MailHelper;
import com.poly.util.MailInfo;

@Controller
public class RegisterController {
	@Autowired
	AccountDAO dao;
	
	@Autowired 
	MailService mailer;
	 
	@Autowired
	HttpServletRequest request;

	
	
	@RequestMapping("/home/register")
	public String register() {
		return "/home/register";
	}

	@PostMapping("/home/register")
	public String viewsregister(@Validated Account acc, BindingResult result) {
		if (result.hasErrors()) {
			return "/home/register";
		} else {
			acc.setAdmin(false);
			acc.setActive(true);
			dao.save(acc);
			sendEmail();
//			if (!dao.existsById(acc.getUsername())) {
			dao.save(acc);
				return "redirect:/home/index";
//			}
//			throw new RuntimeException("Username is exist, please enter new username");
		}
		}

//	}
	
	public void sendEmail() {
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		MailHelper helper = new MailHelper();
		MailInfo mail = new MailInfo();
		mail.setFrom("cuongkvps25207@fpt.edu.vn");
		mail.setTo(email);
		mail.setSubject("Welcome");
		mail.setBody("Welcome " + name);
		try {
			mailer.queue(mail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
