package com.poly.entity;

import lombok.*;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	Integer id;
	String name;
	String image;
	double price;
	int qty = 1;
}
