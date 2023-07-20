package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.user.FaqDto;
import com.team2.finalproject.dto.user.NoticeDto;

@Mapper
public interface FaqMapper {

	List<FaqDto> getAllFaqList();

	FaqDto getFaqByFaqNo(int faqNo);

	void hitCount(int faqNo);
	
	public int insertFaq(FaqDto faqDto); 
	
	public int updateFaq(FaqDto faqDto); 
	
	public int deleteFaq(List<Integer> faqNoList);
	


}
