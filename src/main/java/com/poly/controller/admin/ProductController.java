package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;
	
	
	@RequestMapping("/admin/product")
	public String admin(Model model) {
		Product product = new Product();
		model.addAttribute("pro", product);
		List<Category> cate = categoryDAO.findAll();
		List<Product> list = productDAO.findAll();
		model.addAttribute("listCate", cate);
		model.addAttribute("products", list);
		return "/admin/product";
	}

	@RequestMapping("/admin/product/create")
	public String createProduct(Product product) {
		productDAO.save(product);
		return "redirect:/admin/product";
	}

	@RequestMapping("/admin/product/edit/{id}")
	public String editProduct(Model model, @PathVariable("id") Integer id) {
		Product product = productDAO.getReferenceById(id);
		model.addAttribute("pro", product);
		List<Product> list = productDAO.findAll();
		List<Category> cate = categoryDAO.findAll();
		model.addAttribute("products", list);
		model.addAttribute("listCate", cate);
		return "/admin/product";
	}

	@RequestMapping("/admin/product/update")
	public String updateProduct(Product product) {
		productDAO.save(product);
		return "redirect:/admin/product/edit/" + product.getId();
	}
	
	@RequestMapping("/admin/product/delete/{id}")
	public String deleteProduct(@PathVariable("id") Integer id) {
		Product product = productDAO.getReferenceById(id);
		product.setActive(false);
		productDAO.save(product);
		return "redirect:/admin/product";
	}
}
