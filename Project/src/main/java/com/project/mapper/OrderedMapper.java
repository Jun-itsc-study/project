package com.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.JoinDTO;
import com.project.dto.OrderedDTO;

@Mapper
public interface OrderedMapper {

	int checkNmno(int nmno);

	void insertOrdered(int mno, int nmno, int pno, String address, int ea, int totalprice);

	int insertOrdered(Map<String, Object> map);

	int insertOrderedDetail(Map<String, Object> map);

	List<JoinDTO> selectAllOrder();

	List<JoinDTO> searchOrder(Map<String, Object> map);

	int updateOrderAddress(HashMap<Object, Object> map);

	List<JoinDTO> selectOrderDetail(int ono);

	int updateOrderDNO(HashMap<Object, Object> map);

	OrderedDTO selectOrderDetailMemberInfo(int ono);

	List<JoinDTO> selectMyOrder(int mno);

}
