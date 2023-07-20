package com.team2.finalproject.dto.order;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//주문상세
public class OrderDetailDto {
	//주문상세 번호
	private Integer orderDetailNo;
	//상품 코드
	private Integer productCode;
	//주문 번호
	private Integer orderNo;
	//상품 가격
	private Integer orderDetailPrice;
	//상품 수량
	private Integer orderDetailQuantity;
	
	@Builder
	public OrderDetailDto(Integer orderDetailNo, Integer productCode, Integer orderNo, Integer orderDetailPrice,
			Integer orderDetailQuantity) {
		this.orderDetailNo = orderDetailNo;
		this.productCode = productCode;
		this.orderNo = orderNo;
		this.orderDetailPrice = orderDetailPrice;
		this.orderDetailQuantity = orderDetailQuantity;
	}
	
	

}
