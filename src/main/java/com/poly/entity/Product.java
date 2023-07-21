package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor


@Entity
@Table(name = "product")
public class Product implements Serializable{
	@Id
	@Column(unique = true ,name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer id;
	
	public String name;
	
	public String image;
	
	public Double price;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "createdate")
	public Date createDate = new Date();
	
	public Boolean active;
	
	@ManyToOne 
	@JoinColumn(name = "categoryid")
	public Category category;
	
	
	@OneToMany(mappedBy = "product")
	public List<OrderDetail> orderDetails;
}
