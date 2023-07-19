package com.team2.finalproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.order.OrderDetailDto;
import com.team2.finalproject.dto.pagination.PageRequestDto;
import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.ReviewDto;
import com.team2.finalproject.mapper.MainMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainService {
	
	private final MainMapper mainMapper;
	
	
	public List<ProductDto> getAllProducts() {
		return mainMapper.getAllProduct();
	}
	
	public List<ProductDto> getProductByBasketList(List<BasketDto> basketList){
		List<ProductDto> productList = new ArrayList<ProductDto>();
		
		// productCode로 상품정보 가져오기
		for(int i=0; i<basketList.size(); i++) {
			int productCode = basketList.get(i).getProductCode();
			ProductDto basketProduct = mainMapper.getProductByProductCode(productCode); 
			productList.add(basketProduct);
		}
		return productList;
	}
	
	public ProductDto getProductByProductCode(Integer productCode) {
		ProductDto productDto = mainMapper.getProductByProductCode(productCode);
		return productDto;
	}
	
	public List<ProductDto> getProductByCategoryCode(String categoryCode){
		
		List<ProductDto> productDto = mainMapper.getProductByCategoryCode(categoryCode);
		return productDto;
	}
	
	public List<ProductDto> getProductByCategoryCodeWithPagination(PageRequestDto pageRequest) {
		List<ProductDto> categoryList;
		if(pageRequest.getCategoryCode() == "" || pageRequest.getCategoryCode() == null) {
			categoryList = mainMapper.getProductByPagination(pageRequest);
		}else {
			categoryList = mainMapper.getProductByCategoryCodeWithPagination(pageRequest);
		}
		return categoryList;
	}
	
	public int getCategoryTotalCount(String categoryCode, PageRequestDto pageRequest) {
		int total = mainMapper.getCategoryTotalCount(categoryCode, pageRequest);
		return total;
	}
	
	public List<ReviewDto> getReviewByProductCode(Integer productCode){
		
		List<ReviewDto> reviewDto = mainMapper.getReviewByProductCode(productCode);
	
		return reviewDto;
	}

	public List<ProductDto> getProductByOrderDetailList(List<List<OrderDetailDto>> orderDetailList) {
		List<ProductDto> productList = new ArrayList<ProductDto>();
		for(int i=0; i<orderDetailList.size();i++) {
			for(int j=0; j<orderDetailList.get(i).size();j++) {
			int productCode = orderDetailList.get(i).get(j).getProductCode();
			ProductDto product = mainMapper.getProductByProductCode(productCode);
			productList.add(product);
			}
		}
		return productList;
	}
}
