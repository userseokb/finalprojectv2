package com.team2.finalproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.pagination.PageRequestDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.mapper.MainMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainService {
	
	private final MainMapper mainMapper;
	
	public List<ProductDto> getAllProducts() {
		return mainMapper.getAllProduct();
	}
	
	public ProductDto getProductByProductCode(Integer productCode) {
		
		ProductDto productDto = mainMapper.getProductByProductCode(productCode);
		return productDto;
	}
	
	public List<ProductDto> getProductByCategoryCode(String categoryCode){
		
		List<ProductDto> productDto = mainMapper.getProductByCategoryCode(categoryCode);
		return productDto;
	}
}
