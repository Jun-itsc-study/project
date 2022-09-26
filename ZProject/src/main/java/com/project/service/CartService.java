package com.project.service;

import org.springframework.stereotype.Service;

import com.project.dto.CartDTO;
import com.project.mapper.CartMapper;

@Service
public class CartService {
	private CartMapper mapper;
	
	public CartService(CartMapper mapper) {
		this.mapper = mapper;
	}



	public void insertCart(int mno, int pno, int ea) {
		mapper.insertCart(mno,pno,ea);
	}
	
}
