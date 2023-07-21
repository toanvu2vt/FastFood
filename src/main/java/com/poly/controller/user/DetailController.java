package com.poly.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.service.DetailService;

@Controller
public class DetailController {
	@Autowired
	DetailService detail;

	
	@RequestMapping("/home/detail")
	public String detail(Model model) {
		model.addAttribute("detail", detail);
		return "home/detail";
	}
	@RequestMapping("/detail/add/{id}")
	public String add(@PathVariable("id") Integer id, Model model) {
		detail.add(id);
		return "redirect:/home/detail";
	}
	
}
