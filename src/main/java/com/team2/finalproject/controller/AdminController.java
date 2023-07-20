package com.team2.finalproject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	
	//관리자 메인화면(통계)
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String adminMain() {
			return "adminMain";
		}
	

	

}
