package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.ReviewDto;

@Mapper
public interface ReviewMapper {

	public ReviewDto insertReview(ReviewDto newReview);
	
}
