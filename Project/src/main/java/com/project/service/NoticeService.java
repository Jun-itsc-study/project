package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.dto.NoticeDTO;
import com.project.mapper.NoticeMapper;

@Service
public class NoticeService {
	private NoticeMapper mapper;

	public NoticeService(NoticeMapper mapper) {
		this.mapper = mapper;
	}

	public List<NoticeDTO> selectNoticeList() {
		return mapper.selectNoticeList();
	}
	
	public int insertNotice(NoticeDTO dto) {
		return mapper.insertNotice(dto);
	}
	
	public int deleteNotice(int nno) {
		return mapper.deleteNotice(nno);
	}

	public NoticeDTO selectNotice(int nno) {
		return mapper.selectNotice(nno);
	}

	public int updateNotice(NoticeDTO dto) {
		return mapper.updateNotice(dto);
		
	}
	
}




