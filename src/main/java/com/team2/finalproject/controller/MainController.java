package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.finalproject.dto.pagination.PageRequestDto;
import com.team2.finalproject.dto.pagination.PageResponseDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.mapper.MainMapper;
import com.team2.finalproject.service.MainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {
	
	
	private final MainMapper mainMapper;
	private final MainService mainService;
	
	@GetMapping(value = "/main")
	public String mainmethod(@ModelAttribute PageRequestDto pageRequest,
						Model model) {
		List<ProductDto> result = mainMapper.getProductByPagination(pageRequest);
		log.info("all products = {}", result);
		
		int total = mainMapper.getTotalCount(pageRequest);
		PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);
		
		model.addAttribute("products", result);
		model.addAttribute("pageInfo", pageResponse);
		return "main";
	}
	

	@RequestMapping(value = "/productdetail/{productCode}", method = RequestMethod.GET)
	public String productdetail(@PathVariable Integer productCode,
								Model model) {
		
		ProductDto productDto = mainService.getProductByProductCode(productCode);
		
		model.addAttribute("products", productDto);
			return "productdetail";
		}
	
	@RequestMapping(value = "/category/{categoryCode}",method = RequestMethod.GET)
	public String category(@PathVariable String categoryCode,PageRequestDto pageRequest,
			Model model) {
			List<ProductDto> result = mainMapper.getProductByCategoryCode(categoryCode);
			log.info("all products = {}", result);

			int total = mainMapper.getCategoryTotalCount(categoryCode, pageRequest);
			PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);

			model.addAttribute("products", result);
			model.addAttribute("pageInfo", pageResponse);
			
		return "category";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLogin() {
			
			return "adminLogin";
		}
	
	@RequestMapping(value = "/adminSidebar", method = RequestMethod.GET)
	public String adminSidebar() {
			
			return "adminSidebar";
		}
}
