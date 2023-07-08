package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.user.FaqDto;
import com.team2.finalproject.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	//faq 페이지
	@RequestMapping(value="/faq", method=RequestMethod.GET)
	public String faq(Model model) {
		List<FaqDto> faqList = faqService.getAllFaqList();
		model.addAttribute("faq", faqList);
		return "faq";
	}
	
	//faq 상세 페이지
	@RequestMapping(value="/faq/{faqNo}",method=RequestMethod.GET)
	public String faqDetail(@PathVariable int faqNo, Model model) {
		FaqDto faq = faqService.getFaqByFaqNo(faqNo);
		model.addAttribute("faq",faq);
		return "noticeFaqDetail";
	}
}
