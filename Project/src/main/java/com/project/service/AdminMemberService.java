package com.project.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.JoinDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberVipDTO;
import com.project.mapper.AdminMemberMapper;

@Service
public class AdminMemberService {
	private AdminMemberMapper mapper;

	public AdminMemberService(AdminMemberMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public List<JoinDTO> selectAllMember() {
		return mapper.selectAllMember();
	}
	
//	public int insertMember(MemberDTO dto) {
//		return mapper.insertMember(dto);
//	}

	public int deleteMember(int mno) {
		return mapper.deleteMember(mno);
	}

	public int updateMember(MemberDTO dto) {
		return mapper.updateMember(dto);
	}
	
	public List<JoinDTO> searchMember(String kind, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		if(kind.equals("birth"))
			map.put("search", Date.valueOf(search));
		else if(kind.equals("vno"))
			map.put("search", Integer.parseInt(search));
		else if(kind.equals("mileage"))
			map.put("search", Integer.parseInt(search));
		else
			map.put("search", search);
		return mapper.searchMember(map);
	}

	public List<MemberVipDTO> selectAllVip() {
		return mapper.selectAllVip();
	}

	public int updateMileage(MemberDTO dto) {
		return mapper.updateMileage(dto);
	}

	public int updateMileageLog(int mno, int cmile, String mlog) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("cmile", cmile);
		map.put("mlog", mlog);
		return mapper.updateMileageLog(map);
	}

	public int selectVcondition(int vno) {
		return mapper.selectVcondition(vno);
	}

	public int updateVip(int mno, int vno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("vno", vno);
		return mapper.updateVip(map);
	}

	
	
	
}
