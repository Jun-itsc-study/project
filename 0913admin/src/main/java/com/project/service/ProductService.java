package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.ProductDTO;
import com.project.mapper.ProductMapper;

@Service
public class ProductService {
	private ProductMapper mapper;

	public ProductService(ProductMapper mapper) {
		this.mapper = mapper;
	}

	public List<ProductDTO> selectAllBoard() {
		return mapper.selectAllBoard();
	}

	public ProductDTO selectproduct(int pno) {
		return mapper.selectproduct(pno);
	}

	public int deleteImage(int pno, String image) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("image", "");
		System.out.println("맵 : " + map);
		return mapper.deleteImage(map);
	}

	public int productUpdate(int pno, String detail, int price, String file, String maker, int ea,String pname) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("detail",detail);
		map.put("price",price);
		map.put("image",file);
		map.put("maker", maker);
		map.put("ea", ea);
		map.put("pname", pname);
		int result = mapper.productUpdate2(map);
		System.out.println("맵 : " + map);
		return mapper.productUpdate(map);
	}

	public int deleteProduct(String pno) {
		return mapper.deleteProduct(pno);
	}
}
