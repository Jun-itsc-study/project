package com.project.service;

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

}
