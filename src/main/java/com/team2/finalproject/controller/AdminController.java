package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.user.NoticeDto;
import com.team2.finalproject.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final NoticeService noticeService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String adminMain() {
			return "adminMain";
		}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')") //현재는 security에서 권한 관리 중이어서 필요없음
	@GetMapping("/noticeManage")
	public String notice(Model model) {
		List<NoticeDto> result = noticeService.getAllNoticeList();
		
		model.addAttribute("noticeList", result);
		
		return "adminNoticeManage";
		
	}
	

}
