package com.team2.finalproject.dto.pagination;

import lombok.Builder;
import lombok.Data;

@Data
public class PageRequestDto {
	
	private int pageNum;
	
	private int amount;
	
	private String keyword;
	
	public PageRequestDto() {
		this(1,12);
	}
	
	
	public PageRequestDto(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	@Builder
	public PageRequestDto(int pageNum, int amount, String keyword) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
	}
	
	
	
}
