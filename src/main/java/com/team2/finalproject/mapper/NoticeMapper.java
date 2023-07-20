package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.user.NoticeDto;

@Mapper
public interface NoticeMapper {
	public List<NoticeDto> getAllNoticeList();

	public NoticeDto getNoticeByNoticeNo(int noticeNo);

	public void hitCount(int noticeNo);
	
	public int insertNotice(NoticeDto noticeDto); 
	
	public int updateNotice(NoticeDto noticeDto); 
	
	public int deleteNotice(List<Integer> noticeNoList);
}
