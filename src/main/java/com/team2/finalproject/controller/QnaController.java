package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.finalproject.dto.user.QnaDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.service.QnaService;
import com.team2.finalproject.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
public class QnaController {
	@Autowired
	QnaService qnaService;
		
	@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/qna", method = RequestMethod.GET)
		public void profile(Principal principal,Model model, HttpSession session) {
		        
		        log.info("QNA 창으로 이동");
		        log.info("유저아이디: " + principal.getName());
		        String userid = principal.getName();
		        List<QnaDto> qna = qnaService.getQnaByQnaNoByUserId(userid);
		        session.setAttribute("qna", qna);
		        model.addAttribute("qna", qna);
		        
		        System.out.println(qna);
		}
		
		
		//qna 페이지
		@RequestMapping(value="/qnaList", method=RequestMethod.GET)
		public String qnaDetail (Model model) {
			List<QnaDto> qnaList = qnaService.getAllQnaListByUserNo();
			model.addAttribute("qna", qnaList);
			return "qna";
		}
		
		
		//qna 상세 페이지
//		@RequestMapping(value="/qna/{qnaNo}",method=RequestMethod.GET)
//		public String qnaDetail(@PathVariable int qnaNo, Model model) {
//			QnaDto qna = qnaService.getQnaByQnaNo(qnaNo);
//			model.addAttribute("qna",qna);
//			return "noticeQnaDetail";
//		}
		
		//insertQnaByUserNo
		@RequestMapping(value="/registerQna/{userNo}", method = RequestMethod.POST)
		public String registerQna(@PathVariable int userNo, Model model) {
			QnaDto newQna = qnaService.insertQnaByUserNo(userNo);
			model.addAttribute("newQna", newQna);
			return "";
		}
}
