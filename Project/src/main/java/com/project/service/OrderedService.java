package com.project.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.JoinDTO;
import com.project.dto.OrderedDTO;
import com.project.mapper.OrderedMapper;

@Service
public class OrderedService {

	private OrderedMapper mapper;

	public OrderedService(OrderedMapper mapper) {
		this.mapper = mapper;
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

	public List<JoinDTO> selectAllOrder() {
		return mapper.selectAllOrder();
	}
	public List<JoinDTO> searchOrder(String kind, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		if(kind.equals("ono"))
			map.put("search", Integer.parseInt(search));
		else if(kind.equals("mno"))
			map.put("search", Integer.parseInt(search));
		else if(kind.equals("nmno"))
			map.put("search", Integer.parseInt(search));
		else if(kind.equals("odate"))
			map.put("search", Date.valueOf(search));
		else
			map.put("search", search);
		return mapper.searchOrder(map);
	}

	public List<JoinDTO> selectOrderDetail(int ono) {
		return mapper.selectOrderDetail(ono);
	}

	public int updateOrderDNO(int dno, int ono) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("dno", dno);
		map.put("ono", ono);
		return mapper.updateOrderDNO(map);
	}

	public OrderedDTO selectOrderDetailMemberInfo(int ono) {
		return mapper.selectOrderDetailMemberInfo(ono);
	}

	public int updateOrderAddress(int ono, String postno, String address1, String address2) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("ono", ono);
		map.put("postno", postno);
		map.put("address1", address1);
		map.put("address2", address2);
		return mapper.updateOrderAddress(map);
	}

	public List<JoinDTO> selectMyOrder(int mno) {
		return mapper.selectMyOrder(mno);
	}
	
}
