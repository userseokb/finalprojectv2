package com.team2.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.team2.finalproject.dto.user.ReviewDto;

@Mapper
public interface ReviewMapper {

    // 반환 타입을 void로 변경합니다.
    void insertReview(ReviewDto newReview);

	double getAvgRateByProductCode(Integer productCode);

	void deleteReviewByReviewNo(int userNo, Integer reviewNo);

}