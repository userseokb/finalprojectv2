package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.user.QnaDto;
import com.team2.finalproject.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	QnaService qnaService;
	
		
		//qna 페이지
		@RequestMapping(value="/qna", method=RequestMethod.GET)
		public String qna(Model model) {
			List<QnaDto> qnaList = qnaService.getAllQnaListByUserNo();
			model.addAttribute("qna", qnaList);
			return "qna";
		}
		
		//qna 상세 페이지
		@RequestMapping(value="/qna/{qnaNo}",method=RequestMethod.GET)
		public String qnaDetail(@PathVariable int qnaNo, Model model) {
			QnaDto qna = qnaService.getQnaByQnaNo(qnaNo);
			model.addAttribute("qna",qna);
			return "noticeQnaDetail";
		}
		
		//insertQnaByUserNo
		@RequestMapping(value="/registerQna/{userNo}", method = RequestMethod.POST)
		public String registerQna(@PathVariable int userNo, Model model) {
			QnaDto newQna = qnaService.insertQnaByUserNo(userNo);
			model.addAttribute("newQna", newQna);
			return "";
		}
}
