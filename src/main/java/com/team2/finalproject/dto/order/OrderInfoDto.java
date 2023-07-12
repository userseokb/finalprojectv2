package com.team2.finalproject.dto.order;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderInfoDto {
	//주문상세 번호
		private Integer orderDetailNo;
		//주문 번호
		private Integer orderNo;
		//상품 코드
		private Integer productCode;
		//상품 가격
		private Integer orderDetailPrice;
		//상품 수량
		private Integer orderDetailQuantity;
		//회원번호
		private Integer userNo;
		//상품수량
		private Integer productQuantity;
		//사용 포인트
		private Integer usedPoint;
		//기본주소
		private String basicAddr;
		//상세주소
		private String detailAddr;
		//결제수단
		private String paymentMethod;
		//주문날짜
		private Timestamp orderDate;
		//배송비
		private Integer deliveryCharge;
		//가격
		private Integer price;
		//주문처리상태
		private Integer orderStatus;
		
		@Builder
		public OrderInfoDto(Integer orderDetailNo, Integer orderNo, Integer productCode, Integer orderDetailPrice,
				Integer orderDetailQuantity, Integer userNo, Integer productQuantity, Integer usedPoint,
				String basicAddr, String detailAddr, String paymentMethod, Timestamp orderDate, Integer deliveryCharge,
				Integer price, Integer orderStatus) {
			super();
			this.orderDetailNo = orderDetailNo;
			this.orderNo = orderNo;
			this.productCode = productCode;
			this.orderDetailPrice = orderDetailPrice;
			this.orderDetailQuantity = orderDetailQuantity;
			this.userNo = userNo;
			this.productQuantity = productQuantity;
			this.usedPoint = usedPoint;
			this.basicAddr = basicAddr;
			this.detailAddr = detailAddr;
			this.paymentMethod = paymentMethod;
			this.orderDate = orderDate;
			this.deliveryCharge = deliveryCharge;
			this.price = price;
			this.orderStatus = orderStatus;
		}
		
		
}
