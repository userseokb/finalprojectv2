package com.team2.finalproject.dto.product;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//카테고리
public class CategoryDto {
	//카테고리 코드
	private String categoryCode;
	//카테고리명
	private String categoryName;
	
	@Builder
	public CategoryDto(String categoryCode, String categoryName) {
		super();
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
	}

	
	
}
