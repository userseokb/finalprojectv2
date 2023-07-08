package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.user.NoticeDto;
import com.team2.finalproject.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService; 
	
	@RequestMapping(value = "notice", method=RequestMethod.GET)
	public String notice(Model model) {
		List<NoticeDto> noticeList = noticeService.getAllNoticeList();
		model.addAttribute("notice",noticeList);
		return "notice";
	}
	
	@RequestMapping(value = "notice/{noticeNo}", method=RequestMethod.GET)
	public String noticeDetail(@PathVariable int noticeNo,Model model) {
		NoticeDto notice = noticeService.getNoticeByNoticeNo(noticeNo);
		model.addAttribute("notice",notice);
		return "noticeFaqDetail";
	}
}
