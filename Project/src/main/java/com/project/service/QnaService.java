package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.JoinDTO;
import com.project.dto.QnaDTO;
import com.project.mapper.QnaMapper;

@Service
public class QnaService {
	private QnaMapper mapper;

	public QnaService(QnaMapper mapper) {
		this.mapper = mapper;
	}

	public List<JoinDTO> selectAllQna() {
		return mapper.selectAllQna();
	}

	public JoinDTO selectQna(int qno) {
		return mapper.selectQna(qno);
	}
	
	public int changeQstatus(int qno, int qstatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qno", qno);
		map.put("qstatus", qstatus);
		return mapper.changeQstatus(map);
	}
	
	public int insertQanswer(int qno, String qanswer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qno", qno);
		map.put("qanswer", qanswer);
		return mapper.insertQanswer(map);
	}

	public int deleteQna(int qno) {
		return mapper.deleteQna(qno);
	}

	public int adminDeleteQna(QnaDTO qdto) {
		return mapper.adminDeleteQna(qdto);
	}
	
	



}
