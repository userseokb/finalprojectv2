package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.order.OrderInfoDto;
import com.team2.finalproject.dto.user.UserDto;

@Mapper
public interface UserMapper {
	
	//getAllUser
	public List<UserDto> getAllUser();
	
	//insertUser
	public UserDto insertUser(UserDto newUser);

	public int deleteUserByUserNo(int userNo);

	public UserDto getUserByUserNo(int userNo);
	
	public UserDto getUserByUserId(String userId);

	public List<OrderInfoDto> orderInfoByUserId(String userId);

	public void updateUser(UserDto updateUser);
	
	public int getUserCountByUserId(String userId);
	
	
	

}
