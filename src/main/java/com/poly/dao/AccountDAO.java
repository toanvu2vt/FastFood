package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Account;

public interface AccountDAO extends JpaRepository<Account, Long>{
	@Query("select o from Account o where o.username like ?1")
	public Account getUsername(String username);
}
