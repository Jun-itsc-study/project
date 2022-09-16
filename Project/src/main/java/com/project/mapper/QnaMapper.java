package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.JoinDTO;
import com.project.dto.QnaDTO;

@Mapper
public interface QnaMapper {

	List<JoinDTO> selectAllQna();

	JoinDTO selectQna(int qno);
	
	int changeQstatus(Map<String, Object> map);
	
	int insertQanswer(Map<String, Object> map);

	int deleteQna(int qno);

	int adminDeleteQna(QnaDTO qdto);
	
}
