package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.user.QnaDto;

@Mapper
public interface QnaMapper {

	public List<QnaDto> getAllQnaListByUserNo();

	public QnaDto getQnaByQnaNoByUserId(String userId);

	public QnaDto insertQnaByUserNo(int userNo);

}
