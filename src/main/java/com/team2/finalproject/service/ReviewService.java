package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.mapper.MainMapper;
import com.team2.finalproject.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	ReviewMapper mapper;
	MainMapper mainMapper;
	
	public ReviewDto insertReview(ReviewDto newReview){

		return mapper.insertReview(newReview);
	}

	public ProductDto getProductNameByProductCode(Integer productCode) {
		return null;
	}
}
