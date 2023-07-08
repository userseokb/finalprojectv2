package com.team2.finalproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.pagination.PageRequestDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.mapper.MainMapper;
import com.team2.finalproject.mapper.SearchMapper;

@Service
public class SearchService {

	@Autowired
	SearchMapper searchMapper;
	@Autowired
	MainMapper mainMapper;
	
//	검색단어(keyword) 페이지네이션된 상품 가져오기
	public List<ProductDto> getProductBySearchKeyword(PageRequestDto pageRequest) {
		List<ProductDto> searchList;
		if(pageRequest.getKeyword() == "" || pageRequest.getKeyword() == null) {
			searchList = mainMapper.getProductByPagination(pageRequest);
		}else {
			searchList = searchMapper.getProductBySearchKeyword(pageRequest);
		}
		return searchList;
	}

//	검색단어로 검색한 상품 총 개수
	public int getSearchTotalCount(PageRequestDto pageRequest) {
		int total = searchMapper.getSearchTotalCount(pageRequest);
		return total;
	}

}
