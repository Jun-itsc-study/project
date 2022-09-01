package com.project.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO login(Map<String, Object> map);
	
}
