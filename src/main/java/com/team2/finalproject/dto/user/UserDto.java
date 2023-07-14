package com.team2.finalproject.dto.user;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//사용자
public class UserDto {
	
	//회원 번호
	private Integer userNo;
	//회원 등급
	private String userGrade;
	//회원 이름
	private String userName;
	//회원 id
	private String userId;
	//회원 비밀번호
	private String userPw;
	//회원 이메일
	private String email;
	//생년월일
	private Date birth;
	//가입날짜
	private Timestamp joinDate;
	//휴대폰
	private Integer phone;
	//통신사
	private String tongsin;
	//기본주소
	private String basicAddr;
	//상세주소
	private String detailAddr;
	//누적 구매금액
	private Integer buySum;
	//포인트
	private Integer point;
	//관리자권한
	private String admin;
	//회원 상태
	private String operate;
	
	
	
	@Builder
	public UserDto(Integer userNo, String userGrade, String userName, String userId, String userPw, String email,
			Date birth, Timestamp joinDate, Integer phone, String tongsin, String basicAddr, String detailAddr,
			Integer buySum, Integer point, String admin, String operate) {
		this.userNo = userNo;
		this.userGrade = userGrade;
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.email = email;
		this.birth = birth;
		this.joinDate = joinDate;
		this.phone = phone;
		this.tongsin = tongsin;
		this.basicAddr = basicAddr;
		this.detailAddr = detailAddr;
		this.buySum = buySum;
		this.point = point;
		this.admin = admin;
		this.operate = operate;
	}
	
	
	
}
