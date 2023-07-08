package com.team2.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@GetMapping("/login")
	public String getLoginPage(@RequestParam(value = "error", required = false) String error,
							   @RequestParam(value = "exception", required = false) String exception,
							   Model model) {
			log.info("error = {}",error);
			log.info("exception = {}",exception);
			model.addAttribute("error", error);
			model.addAttribute("exception", exception);
		return "login";
	}
	
	
}

