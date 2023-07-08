package com.team2.finalproject.dto.pagination;

import lombok.Builder;
import lombok.Data;

@Data
public class PageResponseDto {

	private int pageCount;
	
	private int startPage, endPage;
	
	private boolean prev,next;
	
	private int total;
	
	private int realEnd;
	
	private PageRequestDto pageRequest;
	
	public PageResponseDto() {}
	
	
	public PageResponseDto(int total, int pageCount, PageRequestDto pageRequest) {
	
		this.total = total;
        this.pageCount = pageCount;
        this.pageRequest = pageRequest;

        this.endPage = (int)(Math.ceil(pageRequest.getPageNum() * 1.0 / pageCount)) * pageCount;
        this.startPage = endPage - (pageCount - 1);

        realEnd = (int)(Math.ceil(total * 1.0 / pageRequest.getAmount()));

        if(endPage > realEnd){
        	this.endPage = realEnd;
        }

//      리스트의 첫 페이지번호가 1보다 크면 보이도록 합니다.
        this.prev = this.startPage > 1;
//      realEnd변수를 구해서 리스트의 마지막 페이지 번호보다 크면 다음 버튼이 보이도록 합니다.
        this.next = this.endPage < realEnd;
	}
}

