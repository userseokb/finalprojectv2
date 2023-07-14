package com.team2.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReviewController {

	final ReviewService service;
	
	@RequestMapping(value="/review", method=RequestMethod.GET)
	public String review(@ModelAttribute ReviewDto newReview,
						
						Model model){
		
		boolean result =false;
		
		try {
			result = service.insertReview(newReview);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return "review";
	}
}
