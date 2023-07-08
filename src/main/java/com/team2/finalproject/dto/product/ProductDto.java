package com.team2.finalproject.dto.product;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//상품
public class ProductDto {

	//상품 코드
	private Integer productCode;
	//카테고리 코드
	private String categoryCode;
	//상품명
	private String name;
	//상품 설명
	private String content;
	//가격
	private Integer price;
	//재고
	private Integer stock;
	//등록일
	private Timestamp rdate;
	
	
	@Builder
	public ProductDto(Integer productCode, String categoryCode, String name, String content, Integer price,
			Integer stock, Timestamp rdate) {
		this.productCode = productCode;
		this.categoryCode = categoryCode;
		this.name = name;
		this.content = content;
		this.price = price;
		this.stock = stock;
		this.rdate = rdate;
	}
	
	
	
}
