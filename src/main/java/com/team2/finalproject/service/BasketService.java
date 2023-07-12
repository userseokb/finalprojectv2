package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.mapper.BasketMapper;

@Service
public class BasketService {

	@Autowired
	BasketMapper basketMapper;
	
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

}
