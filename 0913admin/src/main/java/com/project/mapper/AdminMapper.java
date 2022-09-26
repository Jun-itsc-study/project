package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.BoardDTO;

@Mapper
public interface AdminMapper {

	
	public int selectBoardNo();
	public int insertBoard(BoardDTO dto);
}
