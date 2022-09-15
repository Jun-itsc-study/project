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

	public int register(String id, String pwd, String name, Date birth, String tel, String postno, String address1, String address2) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("birth", birth);
		map.put("tel", tel);
		map.put("postno", postno);
		map.put("address1", address1);
		map.put("address2", address2);
		
		return mapper.register(map);
	}

	public int registerMemberDetail(int mno, String recommender) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("recommender", recommender);
		return mapper.registerMemberDetail(map);
	}
	
	public MemberDTO selectMember(String id) {
		return mapper.selectMember(id);
	}

	public int updateMember(String id, String postno, String address1, String address2, Date birth, String tel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("birth", birth);
		map.put("tel", tel);
		map.put("postno", postno);
		map.put("address1", address1);
		map.put("address2", address2);
		return mapper.updateMember(map);
	}
	
	public int updatePwd(String id, String pwd, String pwd2) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("pwd2", pwd2);
		
		return mapper.updatePwd(map);
	}

	public MemberDTO findAccount(String id, String name, String tel, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("tel", tel);
		map.put("status", status);
		
		return mapper.findAccount(map);
	}

	public int findChangePwd(String id, String pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		return mapper.findChangePwd(map);
	}

	public String getVip(int vno) {
		return mapper.getVip(vno);
	}

	public int updateLastLogin(int mno) {
		return mapper.updateLastLogin(mno);
	}

	public int updatePchange(int mno) {
		return mapper.updatePchange(mno);
	}

	public int selectVno(int mno) {
		return mapper.selectVno(mno);
	}

	public int checkId(String id) {
		return mapper.checkId(id);
	}



}
