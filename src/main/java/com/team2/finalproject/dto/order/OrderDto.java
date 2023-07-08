package com.team2.finalproject.dto.order;


import java.sql.Timestamp;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//주문
public class OrderDto {
	//주문번호
	private Integer orderNo;
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
	public OrderDto(Integer orderNo, Integer userNo, Integer productQuantity, Integer usedPoint, String basicAddr,
			String detailAddr, String paymentMethod, Timestamp orderDate, Integer deliveryCharge, Integer price,
			Integer orderStatus) {
		this.orderNo = orderNo;
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
