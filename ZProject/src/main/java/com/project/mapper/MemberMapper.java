package com.project.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO login(Map<String, Object> map);

	public int register(Map<String, Object> map);

	public MemberDTO updateMemberView(String id);

	public int updatePwd(Map<String, Object> map);

	public int updateMember(Map<String, Object> map);

	public MemberDTO selectMemberInfo(int mno);

	
}
