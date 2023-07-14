package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.user.FaqDto;
import com.team2.finalproject.mapper.FaqMapper;

@Service
public class FaqService {

	@Autowired
	FaqMapper faqMapper;
	
	public List<FaqDto> getAllFaqList() {
		return faqMapper.getAllFaqList();
	}

	public FaqDto getFaqByFaqNo(int faqNo) {
		faqMapper.hitCount(faqNo);
		return faqMapper.getFaqByFaqNo(faqNo);
	}

}
