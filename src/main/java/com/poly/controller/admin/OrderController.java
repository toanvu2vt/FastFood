package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.OrderDAO;
import com.poly.entity.Order;

@Controller
public class OrderController {
	@Autowired
	OrderDAO orderDAO;
	
	@RequestMapping("/admin/order")
	public String getOrder(Model model) {
		List<Order> list = orderDAO.findAll();
		model.addAttribute("listOrder", list);
		return "/admin/order";
	}
	
}
