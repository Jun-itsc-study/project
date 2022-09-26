package com.project.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.MemberDTO;
import com.project.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;
	
	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public MemberDTO login(String id, String pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		return mapper.login(map);
	}

	public int register(String id, String pwd, String name, Date birth, String tel, String address) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("birth", birth);
		map.put("tel", tel);
		map.put("address", address);
		
		return mapper.register(map);
	}

	public MemberDTO updateMemberView(String id) {
		return mapper.updateMemberView(id);
	}


	public MemberDTO selectMemberInfo(int mno) {
		return mapper.selectMemberInfo(mno);
	}



}
