package com.team2.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.mapper.ReviewMapper;
import com.team2.finalproject.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReviewController {

	final ReviewService service;
	
	@RequestMapping(value="/review/{productCode}", method=RequestMethod.GET)
	public String reviewForm() {	
		
		return "review";
	}
	
	@RequestMapping(value="/review/{productCode}", method=RequestMethod.POST)
	public String review(@ModelAttribute("review") ReviewDto newReview
						,Model model) {
	
			service.insertReview(newReview);
			System.out.println(newReview);
			
		return "redirect:/mypage";
	}
}

