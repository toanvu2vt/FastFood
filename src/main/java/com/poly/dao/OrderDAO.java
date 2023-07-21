package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{
	/*
	 * @Query("SELECT new Report(count(o.id)) " + " FROM Order o " +
	 * " GROUP BY o.userid" + " ORDER BY count(o.id) DESC") List<Order>
	 * countOrder();
	 */
}
