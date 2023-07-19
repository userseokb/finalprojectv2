package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.finalproject.dto.user.CustomUserDetails;
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
	
	//관리자 메인화면(통계)
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String adminMain() {
			return "adminMain";
		}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN')") //현재는 security에서 권한 관리 중이어서 필요없음
	//관리자 공지사항 관리
	@GetMapping("/noticeManage")
	public String adminNotice(Model model) {
		List<NoticeDto> result = noticeService.getAllNoticeList();
		
		model.addAttribute("noticeList", result);
		
		return "adminNoticeManage";
		
	}
	//관리자 공지사항 상세
	@GetMapping("/noticeManage/detail")
	public String adminNoticeDetail(@RequestParam int no, Model model) {
		NoticeDto result = noticeService.getNoticeByNoticeNo(no);
		model.addAttribute("notice", result);
		return "adminNoticeDetail";
	}
	
//	@GetMapping("/noticeManage/modify")
//	public String adminNoticeModify(@RequestParam int no, Model model) {
//		NoticeDto result = noticeService.getNoticeByNoticeNo(no);
//		model.addAttribute("notice", result);
//		return "adminNoticeModify";
//	}
	
	//관리자 공지사항 등록 페이지로 이동
	@GetMapping("/noticeManage/register")
	public String adminNoticeRegisterForm() {
		return "adminNoticeRegister";
	}
	

}
