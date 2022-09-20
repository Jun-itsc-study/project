package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.MemberDTO;
import com.project.dto.MemberVipDTO;

@Mapper
public interface MemberMapper {

	public MemberDTO login(Map<String, Object> map);

	public int register(Map<String, Object> map);

	public MemberDTO selectMember(String id);

	public int updatePwd(Map<String, Object> map);

	public int updateMember(Map<String, Object> map);

	public MemberDTO findAccount(Map<String, Object> map);

	public int findChangePwd(Map<String, Object> map);

	public int registerMemberDetail(Map<String, Object> map);

	public String getVip(int vno);

	public int updateLastLogin(int mno);

	public int updatePchange(int mno);

	public int selectVno(int mno);

	public int checkId(String id);

	public List<MemberVipDTO> selectVipAll();

}
