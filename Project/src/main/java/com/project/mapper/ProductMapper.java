package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CategoryBotDTO;
import com.project.dto.CategoryTopDTO;
import com.project.dto.JoinDTO;
import com.project.dto.ProductDTO;
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
	List<CategoryBotDTO> selectCategoryBot(int ctno);
	int productInsert(Map<String, Object> map);
	int getPno(Map<String, Object> map);
	void insertFileList(Map<String, Object> map);
	int productDetailInsert(Map<String, Object> map);
	int deleteImage(Map<String, Object> map);
	int productUpdate(Map<String, Object> map);
	int productDetailUpdate(Map<String, Object> map);
	String selectFileName(Map<String, Object> map);
}
