package com.poly.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.dao.ProductDAO;
import com.poly.entity.Item;
import com.poly.entity.Product;

//1. phạm vi là session
@SessionScope
@Service
public class DetailServiceImpl implements DetailService {
	@Autowired
	ProductDAO dao;

	Map<Integer, Item> map = new HashMap<>();

	@Override
	public Item add(Integer id) {
		Item item = map.get(id);
		if (item == null) {

			item = new Item();
			Product p = new Product();
			List<Product> list = dao.findAll();
			p = list.stream().filter(it -> it.getId() == id).collect(Collectors.toList()).get(0);
			item.setId(p.getId());
			item.setName(p.getName());
			item.setPrice(p.getPrice());
			item.setQty(1);
			map.put(id, item);
		} else {
			item.setQty(item.getQty() + 1);
		}
		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Item update(Integer id, int qty) {
		Item item = map.get(id);
		if (qty > 0) {
			item.setQty(qty);
		}else {
			map.remove(id);
		}
		return item;
	}

	@Override
	public void clear() {
		map.clear();

	}

	@Override
	public Collection<Item> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getQty()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQty()).sum();
	}
}