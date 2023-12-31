package com.team2.finalproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team2.finalproject.dto.pagination.PageRequestDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.ReviewDto;

@Mapper
public interface MainMapper {
	//전체 상품 가져오기
	public List<ProductDto> getAllProduct();

	public ProductDto getProductByProductCode(Integer productCode);
	
	public List<ProductDto> getProductByPagination(PageRequestDto pageRequest);
	
	public List<ProductDto> getProductByCategoryCode(String categoryCode);

	public int getTotalCount(PageRequestDto pageRequest);
	
	public int getCategoryTotalCount(String categoryCode, PageRequestDto pageRequest);
	
	//category_code로 분류후 페이지네이션
	public List<ProductDto> getProductByCategoryCodeWithPagination(PageRequestDto pageRequest);
	
	public List<ProductDto> getProductByRecentList(PageRequestDto pageRequest);

	public List<ProductDto> getProductByPriceList(PageRequestDto pageRequest);
	
	public List<ProductDto> getProductByPriceListDesc(PageRequestDto pageRequest);

	public List<ProductDto> getProductByCategoryPriceList(PageRequestDto pageRequest);
	
	public List<ProductDto> getProductByCategoryPriceListDesc(PageRequestDto pageRequest);

	public List<ProductDto> getProductByCategoryRecentList(PageRequestDto pageRequest);
	
	// productCode 에 해당하는 리뷰
	public List<ReviewDto> getReviewByProductCode(Integer productCode);
}
