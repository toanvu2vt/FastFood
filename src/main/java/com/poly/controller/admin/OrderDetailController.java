package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.OrderDetailDAO;
import com.poly.entity.OrderDetail;
@Controller
public class OrderDetailController {
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@RequestMapping("/admin/orderdetail")
	public String getOrder(Model model) {
		List<OrderDetail> list = orderDetailDAO.findAll();
		model.addAttribute("listOrd", list);
		return "/admin/orderdetail";
	}
}
