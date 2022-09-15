package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.JoinDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberVipDTO;

@Mapper
public interface AdminMemberMapper {

	List<JoinDTO> selectAllMember();

//	int insertMember(MemberDTO dto);

	int deleteMember(int mno);
	
	MemberDTO selectMember(String id);

	int updateMember(MemberDTO dto);

	List<JoinDTO> searchMember(Map<String, Object> map);

	List<MemberVipDTO> selectAllVip();

	int updateMileage(MemberDTO dto);

	int updateMileageLog(Map<String, Object> map);

	int selectVcondition(int vno);

	int updateVip(Map<String, Object> map);

}
