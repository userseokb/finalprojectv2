package com.team2.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.mapper.ReviewMapper;

@Service
public class ReviewService {

    @Autowired
    ReviewMapper mapper;

    public void insertReview(ReviewDto newReview) {
        mapper.insertReview(newReview);
    }

	public double getAvgRateByProductCode(Integer productCode) {
		double avgRate = mapper.getAvgRateByProductCode(productCode);
		if( avgRate < 0) {
			return -1;
		}
		return (Math.round(avgRate*100)/100.0);
	}

}