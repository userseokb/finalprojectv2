package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.product.BasketDto;

@Mapper
public interface BasketMapper {

	List<BasketDto> getUserBasketByUserNo(int userNo);

	void deleteBasketNo(int basketNo);

}
