package com.team2.finalproject.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.pagination.PageRequestDto;
import com.team2.finalproject.dto.pagination.PageResponseDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

//	검색단어(keyword) 페이지네이션된 상품 가져오기
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String getProductBySearchKeyword(@ModelAttribute PageRequestDto pageRequest, Model model) {
		
		List<ProductDto> result = searchService.getProductBySearchKeyword(pageRequest);
		int total = searchService.getSearchTotalCount(pageRequest);
		PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);
		
		System.out.println(total);
		
		model.addAttribute("products",result);
		model.addAttribute("searchInfo",pageResponse);
		
		return "main";
	}
	
	
}
