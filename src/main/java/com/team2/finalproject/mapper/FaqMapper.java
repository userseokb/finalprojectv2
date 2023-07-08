package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.user.FaqDto;

@Mapper
public interface FaqMapper {

	List<FaqDto> getAllFaqList();

	FaqDto getFaqByFaqNo(int faqNo);
	


}
