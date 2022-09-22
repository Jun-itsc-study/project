package com.project.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderedMapper {

	int checkNmno(int nmno);

	void insertOrdered(int mno, int nmno, int pno, String address, int ea, int totalprice);

	int insertOrdered(Map<String, Object> map);

	int insertOrderedDetail(Map<String, Object> map);

}
