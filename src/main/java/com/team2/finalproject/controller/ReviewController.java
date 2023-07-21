package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.CustomUserDetails;
import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.mapper.ReviewMapper;
import com.team2.finalproject.service.BasketService;
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
	@Autowired
	BasketService basketService;

	@RequestMapping(value = "/review/{productCode}", method = RequestMethod.GET)
	public String reviewForm(@AuthenticationPrincipal CustomUserDetails cud,
							@PathVariable Integer productCode, Model model,
							HttpSession session) {
		
		ProductDto productDto = mainService.getProductByProductCode(productCode);
		List<BasketDto> basketList = basketService.getUserBasketByUserNo(cud.getUserNo());
		int userNo = cud.getUserNo();
		log.info("유저 번호 = {}", userNo);
		model.addAttribute("userInfo",cud);
		model.addAttribute("basketList",basketList);
		model.addAttribute("products", productDto); // 상품 정보를 Model에 담기
		model.addAttribute("userNo", userNo);
		return "review";
	}

	@PostMapping("/review/{productCode}")
	public String submitReview(@ModelAttribute("review") ReviewDto newReview,
	                           @PathVariable Integer productCode,
	                           Model model,@AuthenticationPrincipal CustomUserDetails cud
	                           ) {
		
		System.out.println("Received newReview: " + newReview);
		reviewService.insertReview(newReview);

		return "redirect:/orderHistory";
	}

	
	@PostMapping(value = "/productdetail/{productCode}") // POST 메서드로 변경하여 매핑
	public String deleteReview(@PathVariable Integer productCode, @RequestParam Integer reviewNo, Model model,
			@AuthenticationPrincipal CustomUserDetails cud) {
		int userNo = cud.getUserNo();
		log.info("유저 번호 = {}", userNo);
		System.out.println(userNo);
		
	    reviewService.deleteReviewByReviewNo(userNo, reviewNo);

	    return "redirect:/productdetail/" + productCode; // 삭제 후 상품 상세 페이지로 리다이렉트
	} 
}



