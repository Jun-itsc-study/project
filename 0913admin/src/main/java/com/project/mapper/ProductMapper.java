package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	List<ProductDTO> selectAllBoard();

	ProductDTO selectproduct(int pno);

	int deleteImage(Map<String, Object> map);

	int productUpdate(Map<String, Object> map);

	int productUpdate2(Map<String, Object> map);

	int deleteProduct(String pno);


}
