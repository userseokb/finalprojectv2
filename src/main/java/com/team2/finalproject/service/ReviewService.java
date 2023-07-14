package com.team2.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	ReviewMapper mapper;
	
	public boolean insertReview(ReviewDto newReview) throws Exception {
		
		boolean result = false;
		
		int res = mapper.insertReview(newReview);
		
		if(res != 0) {
			result = true;
		} else {
			throw new Exception("리뷰 작성 실패");
		}
		return result;
	}
}
