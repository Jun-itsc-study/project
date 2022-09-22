package com.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.CartDTO;
import com.project.mapper.CartMapper;

@Service
public class CartService {
	private CartMapper mapper;
	
	public CartService(CartMapper mapper) {
		this.mapper = mapper;
	}

	public int insertCart(int mno, int pno, int ea) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("pno", pno);
		map.put("ea", ea);
		return mapper.insertCart(map);
	}
	
}
