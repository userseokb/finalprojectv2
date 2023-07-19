package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.user.CustomUserDetails;
import com.team2.finalproject.dto.user.QnaDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.service.BasketService;
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
	@Autowired
	UserService userService;
	@Autowired
	BasketService basketService;
		
	@PreAuthorize("isAuthenticated()")
		@RequestMapping(value = "/qna", method = RequestMethod.GET)
		public void profile(@AuthenticationPrincipal CustomUserDetails cud, Model model, HttpSession session) {
		        
		        log.info("QNA 창으로 이동");
//		        log.info("유저아이디: " + principal.getName());
//		        String userid = principal.getName();
		        int userNo = cud.getUserNo();
		        String userid = cud.getUsername();
		        log.info("유저 번호 = {}", userNo);
		        List<QnaDto> qna = qnaService.getQnaByQnaNoByUserId(userid);
		        List<BasketDto> basketList = basketService.getUserBasketByUserNo(userNo);
		        session.setAttribute("qna", qna);
		        model.addAttribute("qna", qna);
		        model.addAttribute("userInfo",cud);
		        model.addAttribute("basketList",basketList);
		        
		        System.out.println(qna);
		}
		
		//qna 상세 페이지
		@RequestMapping(value="/qna/{qnaNo}",method=RequestMethod.GET)
		public String qnaDetail(@PathVariable int qnaNo, Model model, Principal principal) {
			QnaDto qna = qnaService.getQnaByQnaNo(qnaNo);
			String userId = principal.getName();

			if (qna.getAnswer() == null) {
		        qna.setAnswer("친절한 직원이 답변을 준비중입니다.");
		    }

			model.addAttribute("qna", qna);
			model.addAttribute("userId", userId);
			return "qnaDetail";
		}
		
		//모든 qna 가져오기
		@RequestMapping(value="/admin/qnaManage", method=RequestMethod.GET)
		public String qnaDetail (Model model) {
			List<QnaDto> qnaList = qnaService.getAllQnaList();
			model.addAttribute("qna", qnaList);
			return "adminQnaManage";
		}
		
		@RequestMapping(value="/registerQna/{userNo}", method = RequestMethod.GET)
		public String QnaForm(@AuthenticationPrincipal CustomUserDetails cud, Model model, HttpSession session) {
			int userNo = cud.getUserNo();
			model.addAttribute("userNo", userNo);
			log.info("QNA 작성 창으로 이동");
			log.info("유저 번호 = {}", userNo);
			return "/registerQna";
		}

		//insertQnaByUserNo
		@RequestMapping(value="/registerQna/{userNo}", method = RequestMethod.POST)
		public String registerQna(@ModelAttribute QnaDto newQna, Model model) {
			qnaService.insertQna(newQna);
			log.info("newQna = {}", newQna);
			model.addAttribute("newQna", newQna);
			return "redirect:/qna";
		}
		

}
