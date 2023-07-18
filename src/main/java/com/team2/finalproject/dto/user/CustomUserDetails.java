package com.team2.finalproject.dto.user;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;

@Getter
public class CustomUserDetails implements UserDetails{
	
	 //UserDetails에서 기본 getter가 필요한 fields
    private String username;                                     // 아이디
    private String password;                                     // 비밀번호
    private boolean accountNonLocked =true;                      // 계정 잠금 여부    
    private boolean accountNonExpired =true ;                    // 사용자 계정 만료 없음
    private boolean credentialsNonExpired =true ;                // 비밀번호 만료 없음
    private boolean enabled =true;                               // 사용자 활성화 여부
    private List<GrantedAuthority> authorities;  // 사용자 권한 목록
    
	//회원 번호
	private Integer userNo;
	//회원 등급
	private String userGrade;
	//누적 구매금액
	private Integer buySum;
	//포인트
	private Integer point;
	
	public CustomUserDetails(UserDto dto, List<GrantedAuthority> authorities) {
		this.username = dto.getUserId();
		this.password = dto.getUserPw();
		this.userNo = dto.getUserNo();
		this.userGrade = dto.getUserGrade();
		this.buySum = dto.getBuySum();
		this.point = dto.getPoint();
		this.authorities = authorities;
	}
	
	
	

}
