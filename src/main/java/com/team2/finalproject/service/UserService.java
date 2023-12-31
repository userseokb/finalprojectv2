package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.order.OrderInfoDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper mapper;
	
	//getAllUser
	public List<UserDto> getAllUser() {
		return mapper.getAllUser();
	}
	
	//insertUser
	public UserDto insertUser(UserDto newUser) {
		return mapper.insertUser(newUser);
	}

	public int deleteUserByUserNo(int userNo) {
		return mapper.deleteUserByUserNo(userNo);
	}

	public UserDto getUserByUserNo(int userNo) {
		return mapper.getUserByUserNo(userNo);
	}
	
	public UserDto getUserByUserId(String userId) {
		return mapper.getUserByUserId(userId);
	}
	
	public List<OrderInfoDto> orderInfoByUserId(String userId) {
		return mapper.orderInfoByUserId(userId);
	}
	
	public void updateUser(UserDto updateUser){
		mapper.updateUser(updateUser);
	}
	
	public int getUserCountByUserId(String userId) {
		return mapper.getUserCountByUserId(userId);
	}

	public void userWithdrawal(String userId) {
		mapper.userWithdrawal(userId);
	}

	public String findUserId(String userName, int phone) {
		
		String result = "";
		
		try {
			result = mapper.findUserId(userName, phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String findUserPw (String userName,String userId, int phone) {
		
		String result = "";
		
		try {
			result = mapper.findUserPw(userName, userId, phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void temporaryPw (String userId, String userPw) {
		try {
			 mapper.temporaryPw(userId,userPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateUserBuySum(int userNo, int price) {
		mapper.updateUserBuySum(userNo,price);
	}

	public void updateUserPoint(int userNo, int price) {
		int point = Math.floorDiv(price, 1000);
		mapper.updateUserPoint(userNo,point*50);
	}

	public void updateUsedUserPoint(int userNo, int usedPoint) {
		if(usedPoint > 0) {
			mapper.updateUsedUserPoint(userNo, usedPoint);
		}
		
	}

	
}
