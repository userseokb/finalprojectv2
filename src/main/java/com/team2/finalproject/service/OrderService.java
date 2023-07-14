package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.mapper.OrderMapper;

@Service
public class OrderService {
	
	@Autowired
	OrderMapper orderMapper;

	public void insertOrder(int userNo, int productQuantity, int usedPoint, 
			String basicAddr, String detailAddr, String paymentMethod, int deliveryCharge,
			int price) {
		orderMapper.insertOrder(userNo,productQuantity,usedPoint,basicAddr,detailAddr,paymentMethod,deliveryCharge,price);
		
	}

	public void insertDetailOrder(List<List<Integer>> productOrderDetail,int orderNo) {
		for(int i=0; i<productOrderDetail.size(); i++) {
			int productCode = Integer.parseInt(String.valueOf(productOrderDetail.get(i).get(0)));
			int productQuantity = Integer.parseInt(String.valueOf(productOrderDetail.get(i).get(1)));
			orderMapper.insertOrderDetail(productCode,productQuantity,orderNo);
		}
	}

	public int getOrderNoByUserNo(int userNo) {

		return orderMapper.getOrderNoByUserNo(userNo);
	}
	
	
}
