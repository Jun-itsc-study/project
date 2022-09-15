package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	public int deleteNotice(int nno) {
//		return mapper.deleteNotice(nno);
//	}
//
//	public NoticeDTO selectBoard(int nno) {
//		return mapper.selectBoard(nno);
//	}
//
//	public int updateBoarder(int nno, String nname, String ncontent) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("nno", nno);
//		map.put("nname", nname);
//		map.put("ncontent", ncontent);
//		System.out.println("맵 : " + map);
//		return mapper.updateBoarder(map);
//		
//	}
	
}




