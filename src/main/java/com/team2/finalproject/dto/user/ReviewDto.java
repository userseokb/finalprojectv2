package com.team2.finalproject.dto.user;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//리뷰
public class ReviewDto {
	//리뷰 번호
	private Integer reviewNo;
	//회원 번호
	private Integer userNo;
	//상품 코드
	private Integer productCode;
	//상품 이름
	private String productName;
	//제목
	private String title;
	//별점
	private Integer rate;
	//용도
	private Integer purpose;
	//연령층
	private Integer agegroup;
	//작성날짜
	private Date rdate;
	//내용
	private String content;
	
	@Builder
	public ReviewDto(Integer reviewNo, Integer userNo, Integer productCode, String productName, String title,
			Integer rate, Integer purpose, Integer agegroup, Date rdate, String content) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.productCode = productCode;
		this.productName = productName;
		this.title = title;
		this.rate = rate;
		this.purpose = purpose;
		this.agegroup = agegroup;
		this.rdate = rdate;
		this.content = content;
	}
	
	
	
}