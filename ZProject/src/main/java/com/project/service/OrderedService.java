package com.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.mapper.OrderedMapper;

@Service
public class OrderedService {

	private OrderedMapper mapper;

	public OrderedService(OrderedMapper mapper) {
		this.mapper = mapper;
	}

	public int checkNmno(int nmno) {
		return mapper.checkNmno(nmno);
	}

	public int insertOrdered(int mno, int nmno, int pno, int dno, String postno, String address1, String address2, int oea, int totalprice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("nmno", nmno);
		map.put("pno", pno);
		map.put("dno", dno);
		map.put("postno", postno);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("ea", oea);
		map.put("totalprice", totalprice);
		
		
		return mapper.insertOrdered(map);
	}

	public int insertOrderedDetail(int pno, int pprice, int pcount, int ptotalprice) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("pprice", pprice);
		map.put("pno", pno);
		map.put("pcount", pcount);
		map.put("ptotalprice", ptotalprice);
		
		return mapper.insertOrderedDetail(map);
	}
	
	
}
