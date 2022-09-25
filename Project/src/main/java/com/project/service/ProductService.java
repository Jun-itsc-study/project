package com.project.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.CategoryBotDTO;
import com.project.dto.CategoryTopDTO;
import com.project.dto.JoinDTO;
import com.project.dto.ProductDTO;
import com.project.dto.ProductFileDTO;
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

	public List<ProductFileDTO> selectPathList(int pno) {
		return mapper.selectPathList(pno);
	}

	public String selectFilePath(int pno, int fno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("fno", fno);
		return mapper.selectFilePath(map);
	}

	public List<CategoryBotDTO> selectCategoryBot(int ctno) {
		return mapper.selectCategoryBot(ctno);
	}

	public int productInsert(String pname, int ctno, int cbno, String seller) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pname",pname);
		map.put("ctno", ctno);
		map.put("cbno", cbno);
		map.put("seller", seller);
		return mapper.productInsert(map);
	}

	public int getPno(String pname, String seller) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pname", pname);
		map.put("seller", seller);
		return mapper.getPno(map);
	}

	public void insertFileList(String path, int pno) {
		System.out.println(path);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("path", path);
		map.put("pno", pno);
		System.out.println(map.get("path"));
		mapper.insertFileList(map);
	}

	public int productDetailInsert(int pno, int price, int ea, String detail, String maker) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("price", price);
		map.put("ea", ea);
		map.put("detail", detail);
		map.put("maker", maker);
		return mapper.productDetailInsert(map);
	}

	public int deleteImage(int pno, int fno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("fno", fno);
		return mapper.deleteImage(map);
	}

	public int productUpdate(int pno, String pname, String seller, int ctno, int cbno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno",pno);
		map.put("pname",pname);
		map.put("ctno", ctno);
		map.put("cbno", cbno);
		map.put("seller", seller);
		return mapper.productUpdate(map);
	}
	public int productDetailUpdate(int pno, int price, int ea, String detail, String maker) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("price", price);
		map.put("ea", ea);
		map.put("detail", detail);
		map.put("maker", maker);
		return mapper.productDetailUpdate(map);
	}

	public String selectFileName(int pno, int fno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("fno", fno);
		return mapper.selectFileName(map);
	}
}
