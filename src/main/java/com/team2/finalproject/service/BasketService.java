package com.team2.finalproject.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.mapper.BasketMapper;
import com.team2.finalproject.mapper.MainMapper;

@Service
public class BasketService {

	@Autowired
	BasketMapper basketMapper;
	@Autowired
	MainMapper mainMapper;
	
	
	public List<BasketDto> getUserBasketByUserNo(int userNo) {
		return basketMapper.getUserBasketByUserNo(userNo);
	}

	public void deleteBasketNo(int basketNo) {
		basketMapper.deleteBasketNo(basketNo);
	}

	public boolean addToBasket(int userNo, int productCode, int quantity) {		
		return basketMapper.addToBasket(userNo,productCode,quantity);
	}

	public void modifyQuantity(int basketNo, int quantity) {
		basketMapper.modifyQuantity(basketNo,quantity);
	}

	
	public List<ProductDto> getProductCodeByBasketList(HttpServletRequest request) {
		String[] checkedArr = request.getParameterValues("productCheck");
		List<ProductDto> productList = new ArrayList<ProductDto>();
		// basketNo로 product가져오기
		for(int i=0; i<checkedArr.length; i++) {
			int basketNo = Integer.parseInt(checkedArr[i]);
			int productCode = basketMapper.getProductCodeByBasketNo(basketNo);
			ProductDto product = mainMapper.getProductByProductCode(productCode);
			productList.add(product);
		}
		return productList;
	}

	public List<BasketDto> getBasketByBasketList(HttpServletRequest request) {
		String[] checkedArr = request.getParameterValues("productCheck");
		List<BasketDto> orderList = new ArrayList<BasketDto>();
		//주문 유효성 검사
		if(checkedArr.length > 0) {
			for(int i=0; i<checkedArr.length; i++) {
				int basketNo = Integer.parseInt(checkedArr[i]);
				BasketDto basket = basketMapper.getBasketByBasketNo(basketNo);
				orderList.add(basket);
			}
		}
		return orderList;
	}
	
	
	public void deleteBasketNoArr(List<Integer> basketNoArr) {
		for(int i=0; i<basketNoArr.size(); i++) {
			int basketNo = Integer.parseInt(String.valueOf(basketNoArr.get(i)));
			basketMapper.deleteBasketNo(basketNo);
		}
	}

	

	
}
