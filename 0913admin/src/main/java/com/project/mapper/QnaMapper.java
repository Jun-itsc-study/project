package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.QnaDTO;

@Mapper
public interface QnaMapper {

	List<QnaDTO> selectAllBoard();

	QnaDTO selectBoard(int qno);

	int changeQstatus(Map<String, Object> map);

	int qanswerInsert(Map<String, Object> map);

}
