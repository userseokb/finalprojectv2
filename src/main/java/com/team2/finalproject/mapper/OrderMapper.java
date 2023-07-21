package com.team2.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team2.finalproject.dto.order.AmountSalesDto;
import com.team2.finalproject.dto.order.OrderDetailDto;
import com.team2.finalproject.dto.order.OrderDto;
import com.team2.finalproject.dto.order.TotalSalesDto;


@Mapper
public interface OrderMapper {

	void insertOrder(@Param("userNo") int userNo, @Param("productQuantity") int productQuantity, @Param("usedPoint") int usedPoint,
			@Param("basicAddr") String basicAddr, @Param("detailAddr") String detailAddr, @Param("paymentMethod") String paymentMethod, 
			@Param("deliveryCharge") int deliveryCharge, @Param("price") int price);

	void insertOrderDetail(@Param("productCode") int productCode, @Param("productQuantity") int productQuantity, @Param("orderNo") int orderNo);

	int getMaxOrderNoByUserNo(int userNo);

	List<OrderDto> getOrderByUserNo(int userNo);

	List<OrderDetailDto> getOrderDetailByOrderNo(int orderNo);
	
	//통계 차트 1번째(월별 총 판매량)
	List<AmountSalesDto> getMonthSalesAmount();
	
	//통계 차트 2번째(총 판매량 순위(1~3등))
	List<TotalSalesDto> getTotalSalesAmount();

	void updateOrderStateToPurchase(@Param("orderNo") int orderNo);

}
