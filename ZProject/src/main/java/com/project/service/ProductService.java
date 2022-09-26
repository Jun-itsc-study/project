package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.dto.ProductDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductService {
	private ProductMapper mapper;
	
	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}

	public ProductDTO selectProductDTO(int pno) {
		return mapper.selectProductDTO(pno);
	}
	
	public List<ProductDTO> selectAllProduct() {
		return mapper.selectAllProduct();
	}
	
}
