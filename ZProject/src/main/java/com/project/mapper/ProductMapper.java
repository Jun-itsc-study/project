package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	ProductDTO selectProductDTO(int pno);
	List<ProductDTO> selectAllProduct();
}
