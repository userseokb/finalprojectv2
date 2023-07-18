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

	public List<QnaDto> getAllQnaListByUserNo() {
		return qnaMapper.getAllQnaListByUserNo();
	}

	public List<QnaDto> getQnaByQnaNoByUserId(String userId) {
		return qnaMapper.getQnaByQnaNoByUserId(userId);
	}

	public QnaDto insertQnaByUserNo(int userNo) {
		return qnaMapper.insertQnaByUserNo(userNo);
	}

}
