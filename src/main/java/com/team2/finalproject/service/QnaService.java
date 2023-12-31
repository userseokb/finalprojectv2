package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.user.QnaDto;
import com.team2.finalproject.mapper.QnaMapper;

@Service
public class QnaService {
	@Autowired
	QnaMapper qnaMapper;

	public List<QnaDto> getQnaByQnaNoByUserId(String userId) {
		return qnaMapper.getQnaByQnaNoByUserId(userId);
	}

	public QnaDto getQnaByQnaNo(int qnaNo) {
		qnaMapper.hitCount(qnaNo);
		QnaDto qnaDto = qnaMapper.getQnaByQnaNo(qnaNo);
		return qnaMapper.getQnaByQnaNo(qnaNo);
	}

	public List<QnaDto> getAllQnaList() {
		return qnaMapper.getAllQnaList();
	}

	public QnaDto insertQna(QnaDto newQna) {
		return qnaMapper.insertQna(newQna);
	}

	public void insertAnswer(QnaDto updateQna) {
		qnaMapper.insertAnswer(updateQna);
	}


}
