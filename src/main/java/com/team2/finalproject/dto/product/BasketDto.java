package com.team2.finalproject.dto.product;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//장바구니
public class BasketDto {
	
	//장바구니 번호
	private Integer basketNo;
	//회원번호
	private Integer userNo;
	//상품코드
	private Integer productCode;
	//상품수량
	private Integer productQuantity;
	//배송비
	private Integer deliveryCharge;
	//상품총가격
	private Integer priceSum;
	
	@Builder
	public BasketDto(Integer basketNo, Integer userNo, Integer productCode, Integer productQuantity,
			Integer deliveryCharge, Integer priceSum) {
		this.basketNo = basketNo;
		this.userNo = userNo;
		this.productCode = productCode;
		this.productQuantity = productQuantity;
		this.deliveryCharge = deliveryCharge;
		this.priceSum = priceSum;
	}
	


}
