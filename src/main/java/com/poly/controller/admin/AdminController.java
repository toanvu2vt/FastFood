package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.AccountDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Report;


@Controller
public class AdminController {
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	AccountDAO accountDAO;
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@RequestMapping("/admin")
	public String getAdmin(Model model) {
		
		long totalAcc = accountDAO.count();
		long totalPro = productDAO.count();
		long totalOrd = orderDAO.count();
		long totalPayment = 0;
		
		
		List<OrderDetail> list = orderDetailDAO.findAll();
		for (OrderDetail orderDetail : list) {
			totalPayment += orderDetail.getQuantity() * orderDetail.getPrice();
		}
		
		List<Report> items = productDAO.getInventorryByCategory();

		model.addAttribute("totalPayment", totalPayment);
		model.addAttribute("items", items);
		model.addAttribute("totalAcc", totalAcc);
		model.addAttribute("totalPro", totalPro);
		model.addAttribute("totalOrd", totalOrd);
		return "/admin/admin";
	}
	
	
}
