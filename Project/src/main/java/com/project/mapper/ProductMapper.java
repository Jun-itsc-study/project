package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CategoryBotDTO;
import com.project.dto.CategoryTopDTO;
import com.project.dto.JoinDTO;
import com.project.dto.ProductFileDTO;

@Mapper
public interface ProductMapper {

	JoinDTO selectProduct(int pno);
	List<JoinDTO> selectAllProduct(int type);
	List<CategoryTopDTO> selectAllCategoryTop();
	List<CategoryBotDTO> selectAllCategoryBot();
	List<JoinDTO> selectCaProduct(Map<String, Object> map);
	int selectProductCount();
	List<ProductFileDTO> selectPathList(int pno);
	String selectFilePath(Map<String, Object> map);
}
