package com.team2.finalproject.api;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team2.finalproject.dto.order.AmountSalesDto;
import com.team2.finalproject.dto.order.TotalSalesDto;
import com.team2.finalproject.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/api")
public class OrderApiController {
	
	private final OrderService orderService;
	
	//첫번째 차트 api(월별 판매량)
	@PostMapping("/monthSales")
	public List<AmountSalesDto> getMonthSalesAmountApi() {
		List<AmountSalesDto> result = orderService.getMonthSalesAmount();
		for(AmountSalesDto i : result) {
			i.setMonth(i.month + "월");
		}
		log.info("result = {}", result);
		return result;
	}
	
	//두번째 차트 api(총 판매량 순위(1~3등))
	@PostMapping("/totalSales")
	public List<TotalSalesDto> getTotalSalesAmountApi() {
		List<TotalSalesDto> result = orderService.getTotalSalesAmount();
		log.info("result = {}", result);
		return result;
	}

}
