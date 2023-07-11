package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.service.BasketService;
import com.team2.finalproject.service.MainService;
import com.team2.finalproject.service.UserService;

@Controller
public class BasketController {
	
	@Autowired
	BasketService basketService;
	@Autowired
	UserService userService;
	@Autowired
	MainService mainService;
	
	//장바구니
	@RequestMapping(value="basket", method=RequestMethod.GET)
	public String basket(Principal principal, Model model) {
		//security 에서 userId 획득
		String userId = principal.getName();
		//조회
		int userNo = userService.getUserByUserId(userId).getUserNo();
		List<BasketDto> basketList = basketService.getUserBasketByUserNo(userNo);
		List<ProductDto> productList = new ArrayList<ProductDto>();
		
		// productCode로 상품정보 가져오기
		for(int i=0; i<basketList.size(); i++) {
			int productCode = basketList.get(i).getProductCode();
			System.out.println(productCode);
			ProductDto basketProduct = mainService.getProductByProductCode(productCode); 
			productList.add(basketProduct);
		}
		model.addAttribute("basketList", basketList);
		model.addAttribute("productList",productList);
		
		return "basket";
	}
	
	@RequestMapping(value="basket/{basketNo}", method=RequestMethod.DELETE)
	public String deleteBasket(@PathVariable int basketNo) {
		basketService.deleteBasketNo(basketNo);
		return "redirect:/basket";
	}
}
