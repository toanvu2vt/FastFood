package com.poly.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class ShopController {

	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;

	@RequestMapping("/home/shop")
	public String trangchu(Model model) {
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "/home/shop";
	}
	@PostMapping("/shop/findByName")
	public String findByName(Model model, @RequestParam("keyword") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		List<Product> items = dao.findByKeyWord("%" + kwords + "%" );
		model.addAttribute("items", items);
		return "home/shop";
	}
	@RequestMapping("/home/sort1")
	public String sort1(Model model, 
			@RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort);
		model.addAttribute("items", items);
		return "home/shop";
	}
	@RequestMapping("/home/sort2")
	public String sort2(Model model, 
			@RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("price"));
		model.addAttribute("field", field.orElse("price").toUpperCase());
		List<Product> items = dao.findAll(sort);
		model.addAttribute("items", items);
		return "home/shop";
	}
//	@RequestMapping("/product/page")
//	public String paginate(Model model, @RequestParam("p") Optional<Integer> p) {
//		Pageable pageable = PageRequest.of(p.orElse(0), 5);
//		Page<Product> page = dao.findAll(pageable);
//		model.addAttribute("page", page);
//		return "product/page";
//	}
}
