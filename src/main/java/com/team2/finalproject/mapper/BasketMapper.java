package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team2.finalproject.dto.product.BasketDto;

@Mapper
public interface BasketMapper {

	List<BasketDto> getUserBasketByUserNo(int userNo);

	void deleteBasketNo(int basketNo);

	boolean addToBasket(@Param("userNo") int userNo,@Param("productCode") int productCode,@Param("quantity") int quantity);

	void modifyQuantity(@Param("basketNo") int basketNo,@Param("quantity") int quantity);

}
