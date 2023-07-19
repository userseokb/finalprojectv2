package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.user.NoticeDto;
import com.team2.finalproject.mapper.NoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	public List<NoticeDto> getAllNoticeList(){
		
		return noticeMapper.getAllNoticeList();
	}

	public NoticeDto getNoticeByNoticeNo(int noticeNo) {
		noticeMapper.hitCount(noticeNo);
		return noticeMapper.getNoticeByNoticeNo(noticeNo);
	}
	
	public int insertNotice(NoticeDto noticeDto) {
		return noticeMapper.insertNotice(noticeDto);
	}
}
