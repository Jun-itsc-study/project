package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.CategoryBotDTO;
import com.project.dto.CategoryTopDTO;
import com.project.dto.JoinDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductService {
	private ProductMapper mapper;
	
	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}

	public JoinDTO selectProduct(int pno) {
		return mapper.selectProduct(pno);
	}
	
	public List<JoinDTO> selectAllProduct(int type) {
		return mapper.selectAllProduct(type);
	}

	public List<CategoryTopDTO> selectAllCategoryTop() {
		return mapper.selectAllCategoryTop();
	}

	public List<CategoryBotDTO> selectAllCategoryBot() {
		return mapper.selectAllCategoryBot();
	}

	public List<JoinDTO> selectCaProduct(String cate, int gory, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("gory", gory);
		map.put("type", type);
		return mapper.selectCaProduct(map);
	}

	public int selectProductCount() {
		return mapper.selectProductCount();
	}
	
}
