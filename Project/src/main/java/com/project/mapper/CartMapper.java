package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CartDTO;

@Mapper
public interface CartMapper {

	int insertCart(Map<String, Object> map);

	List<Integer> getPnoList(int mno);

	List<CartDTO> selectCart(int mno);

	int updateCart(Map<String, Object> map);

	int deleteCart(int cno);

	int deleteCartAll(int mno);

}
