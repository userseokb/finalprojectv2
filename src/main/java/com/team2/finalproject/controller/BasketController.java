package com.team2.finalproject.controller;

import java.security.Principal;
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
		List<ProductDto> productList = mainService.getProductByBasketList(basketList);
		

		// productCode로 상품정보 가져오기
		for(int i=0; i<basketList.size(); i++) {
			int productCode = basketList.get(i).getProductCode();
			ProductDto basketProduct = mainService.getProductByProductCode(productCode); 
			productList.add(basketProduct);
		}
		System.out.println(basketList);
		

		model.addAttribute("basketList", basketList);
		model.addAttribute("productList",productList);

		System.out.println(productList);
		
		return "basket";
	}
	
	// 항목삭제
	@RequestMapping(value="basket/{basketNo}", method=RequestMethod.DELETE)
	public String deleteBasket(@PathVariable int basketNo) {
		basketService.deleteBasketNo(basketNo);
		return "redirect:/basket";
	}
	
	// 장바구니 추가
	@RequestMapping(value="basket/{productCode}/{quantity}", method=RequestMethod.POST)
	public String addToBasket(@PathVariable int productCode, @PathVariable int quantity, Principal principal) {
		//security 에서 userId 획득
		String userId = principal.getName();
		//조회
		int userNo = userService.getUserByUserId(userId).getUserNo();
		basketService.addToBasket(userNo,productCode,quantity);
		
		return "redirect:/productdetail/"+productCode;
	}
	
	@RequestMapping(value="basket/{basketNo}/{quantity}", method=RequestMethod.PUT)
	public String modifyQuantity(@PathVariable int basketNo, @PathVariable int quantity) {
		
		basketService.modifyQuantity(basketNo,quantity);
		return "redirect:/basket";
	}
	
	
	
}
