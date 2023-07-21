package com.poly.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.service.SessionService;
import com.poly.service.ShoppingCartService;

@Controller
public class CartController {
	@Autowired
	ShoppingCartService cart;
	
	@Autowired
	SessionService session;

	@RequestMapping("/home/cart")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("amount", cart.getAmount());
		return "home/cart";
	}


	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id, Model model) {
		cart.add(id);
		session.set("cartQuantity", cart.getCount());
		model.addAttribute("message", "Update success!");
		return "redirect:/home/shop";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id, Model model) {
		cart.remove(id);
		session.set("cartQuantity", cart.getCount());
		model.addAttribute("message", "Update success!");
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/home/cart";
	}

	@RequestMapping("/cart/clear")
	public String clear(Model model) {
		cart.clear();
		model.addAttribute("message", "Clear success!");
		return "redirect:/home/cart";
	}
	@RequestMapping("/home/order")
	public String order(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("amount", cart.getAmount());
		return "home/order";
	}
}