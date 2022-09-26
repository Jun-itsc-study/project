package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CartDTO;

@Mapper
public interface CartMapper {

	void insertCart(int mno, int pno, int ea);

}
