package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.mapper.ReviewMapper;
import com.team2.finalproject.service.MainService;
import com.team2.finalproject.service.ReviewService;
import com.team2.finalproject.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	MainService mainService;
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/review/{productCode}", method=RequestMethod.GET)
	public String reviewForm(@PathVariable Integer productCode,
								Model model) {	
		
		ProductDto productDto = mainService.getProductByProductCode(productCode);
		model.addAttribute("products", productDto);
		return "review";
	}
	
	 @RequestMapping(value = "/review/{productCode}", method = RequestMethod.POST)
	    public String review(@ModelAttribute("review") ReviewDto newReview,
	    					@PathVariable Integer productCode,
	                         Model model,
	                         Principal principal) {

		 	ProductDto productDto = mainService.getProductByProductCode(productCode);
		//security 에서 userId 획득
			String userId = principal.getName();
			//조회
			int userNo = userService.getUserByUserId(userId).getUserNo();
			
		    // ReviewDto에 가져온 userNo를 설정합니다.
		    newReview.setUserNo(userNo);
	        // ReviewDto를 데이터베이스에 저장합니다.
	        reviewService.insertReview(newReview);
	        model.addAttribute("products", productDto);
	        return "redirect:/mypage";
	    }
}

