package com.project.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CartDTO;

@Mapper
public interface CartMapper {

	int insertCart(Map<String, Object> map);

}
