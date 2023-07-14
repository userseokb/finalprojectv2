package com.team2.finalproject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface OrderMapper {

	void insertOrder(@Param("userNo") int userNo, @Param("productQuantity") int productQuantity, @Param("usedPoint") int usedPoint,
			@Param("basicAddr") String basicAddr, @Param("detailAddr") String detailAddr, @Param("paymentMethod") String paymentMethod, 
			@Param("deliveryCharge") int deliveryCharge, @Param("price") int price);

	void insertOrderDetail(@Param("productCode") int productCode, @Param("productQuantity") int productQuantity, @Param("orderNo") int orderNo);

	int getOrderNoByUserNo(int userNo);

}
