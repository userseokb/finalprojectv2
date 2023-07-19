package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team2.finalproject.dto.order.OrderDetailDto;
import com.team2.finalproject.dto.order.OrderDto;


@Mapper
public interface OrderMapper {

	void insertOrder(@Param("userNo") int userNo, @Param("productQuantity") int productQuantity, @Param("usedPoint") int usedPoint,
			@Param("basicAddr") String basicAddr, @Param("detailAddr") String detailAddr, @Param("paymentMethod") String paymentMethod, 
			@Param("deliveryCharge") int deliveryCharge, @Param("price") int price);

	void insertOrderDetail(@Param("productCode") int productCode, @Param("productQuantity") int productQuantity, @Param("orderNo") int orderNo);

	int getMaxOrderNoByUserNo(int userNo);

	List<OrderDto> getOrderByUserNo(int userNo);

	List<OrderDetailDto> getOrderDetailByOrderNo(int orderNo);

}
