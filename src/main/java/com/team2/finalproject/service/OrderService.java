package com.team2.finalproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.order.OrderDetailDto;
import com.team2.finalproject.dto.order.OrderDto;
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

	public int getMaxOrderNoByUserNo(int userNo) {

		return orderMapper.getMaxOrderNoByUserNo(userNo);
	}

	public List<OrderDto> getOrderByUserNo(int userNo) {
		List<OrderDto> orderDetailList  = orderMapper.getOrderByUserNo(userNo);
		
		return orderDetailList;
	}

	public List<OrderDetailDto> getOrderDetatilByOrder(List<OrderDto> orderList) {
		List<OrderDetailDto> orderDetailList = new ArrayList<OrderDetailDto>();
		for(int i=0; i<orderList.size();i++) {
			int orderNo = orderList.get(i).getOrderNo();
			OrderDetailDto orderDetail = orderMapper.getOrderDetailByOrderNo(orderNo);
			orderDetailList.add(orderDetail);
		}
		return orderDetailList;
	}
	
	
}
