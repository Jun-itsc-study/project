package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CategoryBotDTO;
import com.project.dto.CategoryTopDTO;
import com.project.dto.JoinDTO;

@Mapper
public interface ProductMapper {

	JoinDTO selectProductDTO(int pno);
	List<JoinDTO> selectAllProduct();
	List<CategoryTopDTO> selectAllCategoryTop();
	List<CategoryBotDTO> selectAllCategoryBot();
	List<JoinDTO> selectCaProduct(Map<String, Object> map);
}
