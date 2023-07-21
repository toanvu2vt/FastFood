package com.poly.controller;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;
import com.poly.service.ParamService;
import com.poly.service.SessionService;


@Controller
public class HomeController {
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;
	@RequestMapping("/home/index")
	public String paginate(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		return "home/index";
	}




}
