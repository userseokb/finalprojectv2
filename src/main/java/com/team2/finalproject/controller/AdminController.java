package com.team2.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public String adminMain() {
			
			return "adminMain";
		}

}
