package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
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
import com.team2.finalproject.dto.user.ReviewDto;
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
						Model model, Authentication authentication) {
		//관리자 권한 있을시 관리자 페이지로 리다이렉트 되는 로직
		if(authentication != null) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			Optional<? extends GrantedAuthority> authOp = userDetails.getAuthorities()
			.stream()
			.findFirst();
			GrantedAuthority auth = authOp.get();
		log.info("GrantedAuthority = {}", auth.getAuthority());
		if(auth.getAuthority().equals("ROLE_ADMIN")) {
			return "redirect:admin/main";
		}
	}

		
		List<ProductDto> result = mainMapper.getProductByPagination(pageRequest);
//		log.info("all products = {}", result);
		
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
		List<ReviewDto> reviewDto = mainService.getReviewByProductCode(productCode);
		
		model.addAttribute("products", productDto);
		model.addAttribute("reviews", reviewDto);
			return "productdetail";
		}
//	
//	@RequestMapping(value = "/category/{categoryCode}",method = RequestMethod.GET)
//	public String category(@PathVariable String categoryCode,PageRequestDto pageRequest,
//			Model model) {
//			List<ProductDto> result = mainMapper.getProductByCategoryCode(categoryCode);
//			log.info("all products = {}", result);
//
//			int total = mainMapper.getCategoryTotalCount(categoryCode, pageRequest);
//			PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);
//
//			model.addAttribute("products", result);
//			model.addAttribute("pageInfo", pageResponse);
//			
//		return "category";
//	}
	
	//카테고리 A,B,C,D 별로 페이지네이션
		@RequestMapping(value = "/category/{categoryCode}", method=RequestMethod.GET)
		public String getProductByCategoryCodeWithPagination(
															@PathVariable String categoryCode,PageRequestDto pageRequest,
															Model model) {
			
			List<ProductDto> categoryList = mainMapper.getProductByCategoryCodeWithPagination(pageRequest);
			
			int total = mainMapper.getCategoryTotalCount(categoryCode, pageRequest);
			PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);
			
			model.addAttribute("products", categoryList);
			model.addAttribute("pageInfo", pageResponse);
			model.addAttribute("category", categoryCode);
			return "category";
		}
		
		// main 최신순|낮은가격|높은가격 
		@RequestMapping(value = "/main/{sort}", method=RequestMethod.GET)
		public String getProductBySort(
				@PathVariable String sort,@ModelAttribute PageRequestDto pageRequest,Model model) {
			List<ProductDto> productList;
			// 최신순
			if(sort.equals("recentlist")) {
				productList = mainMapper.getProductByRecentList(pageRequest);}
			// 낮은가격
			else if (sort.equals("pricelist")) {
				productList = mainMapper.getProductByPriceList(pageRequest);}
			// 높은가격
			else if (sort.equals("pricelistdesc")) {
				productList = mainMapper.getProductByPriceListDesc(pageRequest);}
			// 에러시 메인으로 이동 
			else {
				return "main";
			}
			int total = mainMapper.getTotalCount(pageRequest);
			PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);
			model.addAttribute("products", productList);
			model.addAttribute("pageInfoSort", pageResponse);
			model.addAttribute("sort", sort);
			
			return "main";
		}

		// 카테고리에서 정렬
		@RequestMapping(value = "/{categoryCode}/{sort}", method=RequestMethod.GET)
		public String getProductByCategorySort(	
				@PathVariable String categoryCode,@PathVariable String sort,PageRequestDto pageRequest,
															Model model) {
			System.out.println(sort);
			List<ProductDto> categoryList;
			// 최신순
			if(sort.equals("recentlist")) {
				categoryList = mainMapper.getProductByCategoryRecentList(pageRequest);}
			// 낮은가격
			else if (sort.equals("pricelist")) {
				categoryList = mainMapper.getProductByCategoryPriceList(pageRequest);}
			// 높은가격
			else if (sort.equals("pricelistdesc")) {
				categoryList = mainMapper.getProductByCategoryPriceListDesc(pageRequest);}
			// 에러시 메인으로 이동 
			else {
				return "category";
			}

			int total = mainMapper.getCategoryTotalCount(categoryCode, pageRequest);
			PageResponseDto pageResponse = new PageResponseDto(total, 5, pageRequest);
			
			
			model.addAttribute("products", categoryList);
			model.addAttribute("pageInfoSort", pageResponse);
			model.addAttribute("category", categoryCode);
			model.addAttribute("sort", sort);
			return "category";
		}
		
}
