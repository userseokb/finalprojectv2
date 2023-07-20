package com.team2.finalproject.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class AdminNoticeController {
	
	private final NoticeService noticeService;

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
	
	//관리자 공지사항 등록 페이지로 이동
	@GetMapping("/noticeManage/register")
	public String adminNoticeRegisterForm() {
		return "adminNoticeRegister";
	}
	
	//실제 관리자 공지사항 등록
	@PostMapping("/noticeManage/register")
	public String adminNoticeRegister(@AuthenticationPrincipal CustomUserDetails cus,
										@RequestParam String title,
										@RequestParam String state,
										@RequestParam String content) {
		
		Date currentDate = new Date(System.currentTimeMillis()); //현재 날짜
		
		NoticeDto newNotice = NoticeDto.builder()
								.userNo(cus.getUserNo())
								.title(title)
								.state(state)
								.writeDate(currentDate)
								.content(content)
								.build();
		log.info("newNotice = {}", newNotice);
		int result = noticeService.insertNotice(newNotice);
		if(result == 0) {
			log.info("등록 실패");
		}
				
		return "redirect:/admin/noticeManage";
	}
	
	//관리자 공지사항 수정 페이지로 이동
	@GetMapping("/noticeManage/modify")
	public String adminNoticeModifyForm(@RequestParam int no, Model model) {
		NoticeDto result = noticeService.getNoticeByNoticeNo(no);
		model.addAttribute("notice", result);
		return "adminNoticeModify";
	}
	
	//관리자 공지사항 실제 수정
	@PostMapping("/noticeManage/modify")
	public String adminNoticeModify(@AuthenticationPrincipal CustomUserDetails cus,
									@RequestParam String title,
									@RequestParam String state,
									@RequestParam String content,
									@RequestParam int noticeNo) {
		
		NoticeDto notice = noticeService.getNoticeByNoticeNo(noticeNo);
		notice.setTitle(title);
		notice.setState(state);
		notice.setContent(content);
		int result = noticeService.updateNotice(notice);
		if(result == 0) {
			log.info("수정 실패");
		}
		
		return "redirect:/admin/noticeManage";
	}
	
	
	@PostMapping("/noticeManage/delete")
	public String adminNoticeDelete(@RequestParam String ckStr) {
		log.info("param = {}", ckStr);
		List<Integer> noticeNoList = new ArrayList<>();
		String[] splitStr = ckStr.split(",");
		for(int i = 0; i<splitStr.length; i++) {
			 noticeNoList.add(Integer.parseInt(splitStr[i]));
		}
		log.info("int list = {}", noticeNoList);
		int result = noticeService.deleteNotice(noticeNoList);
		if(result == 0) {
			log.info("삭제 실패");
		}
		
		return "redirect:/admin/noticeManage";
	}
	
	
	
	
	
}
