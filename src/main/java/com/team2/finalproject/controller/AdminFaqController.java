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
import com.team2.finalproject.dto.user.FaqDto;
import com.team2.finalproject.service.FaqService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminFaqController {
	
	private final FaqService faqService;
	
	//관리자 faq 관리
	@GetMapping("/faqManage")
	public String adminFaq(Model model) {
		List<FaqDto> result = faqService.getAllFaqList();
		
		model.addAttribute("faqList", result);
		
		return "adminFaqManage";
		
	}
	
	//관리자 Faq 상세
	@GetMapping("/faqManage/detail")
	public String adminFaqDetail(@RequestParam int no, Model model) {
		FaqDto result = faqService.getFaqByFaqNo(no);
		model.addAttribute("faq", result);
		return "adminFaqDetail";
	}
	
	//관리자 Faq 등록 페이지로 이동
	@GetMapping("/faqManage/register")
	public String adminFaqRegisterForm() {
		return "adminFaqRegister";
	}
	
	//실제 관리자 Faq 등록
	@PostMapping("/faqManage/register")
	public String adminFaqRegister(@AuthenticationPrincipal CustomUserDetails cus,
										@RequestParam String title,
										@RequestParam String state,
										@RequestParam String content) {
		
		Date currentDate = new Date(System.currentTimeMillis()); //현재 날짜
		
		FaqDto newFaq = FaqDto.builder()
								.userNo(cus.getUserNo())
								.title(title)
								.state(state)
								.writeDate(currentDate)
								.content(content)
								.build();
		log.info("newFaq = {}", newFaq);
		int result = faqService.insertFaq(newFaq);
		if(result == 0) {
			log.info("등록 실패");
		}
				
		return "redirect:/admin/faqManage";
	}
	
	//관리자 Faq 수정 페이지로 이동
	@GetMapping("/faqManage/modify")
	public String adminFaqModifyForm(@RequestParam int no, Model model) {
		FaqDto result = faqService.getFaqByFaqNo(no);
		model.addAttribute("faq", result);
		return "adminFaqModify";
	}
	
	//관리자 Faq 실제 수정
	@PostMapping("/faqManage/modify")
	public String adminFaqModify(@AuthenticationPrincipal CustomUserDetails cus,
									@RequestParam String title,
									@RequestParam String state,
									@RequestParam String content,
									@RequestParam int faqNo) {
		
		FaqDto faq = faqService.getFaqByFaqNo(faqNo);
		faq.setTitle(title);
		faq.setState(state);
		faq.setContent(content);
		int result = faqService.updateFaq(faq);
		if(result == 0) {
			log.info("수정 실패");
		}
		
		return "redirect:/admin/faqManage";
	}
	
	//관리자 faq 삭제
	@PostMapping("/faqManage/delete")
	public String adminFaqDelete(@RequestParam String ckStr) {
		log.info("param = {}", ckStr);
		List<Integer> faqNoList = new ArrayList<>();
		String[] splitStr = ckStr.split(",");
		for(int i = 0; i<splitStr.length; i++) {
			faqNoList.add(Integer.parseInt(splitStr[i]));
		}
		log.info("int list = {}", faqNoList);
		int result = faqService.deleteFaq(faqNoList);
		if(result == 0) {
			log.info("삭제 실패");
		}
		
		return "redirect:/admin/faqManage";
	}
	

}
