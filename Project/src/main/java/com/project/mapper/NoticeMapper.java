package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {


	int deleteNotice(int nno);

	List<NoticeDTO> selectNoticeList();

	int insertNotice(NoticeDTO dto);


//	BoardDTO selectBoard(int nno);
//
//	int updateBoarder(Map<String, Object> map);


}





