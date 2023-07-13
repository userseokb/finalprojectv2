package com.team2.finalproject.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.service.BasketService;
import com.team2.finalproject.service.MainService;
import com.team2.finalproject.service.UserService;

@Controller
public class OrderController {

	@Autowired
	BasketService basketService;
	@Autowired
	MainService mainService;
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String order(HttpServletRequest request, Model model,Principal principal) {
		String[] arr = request.getParameterValues("productCheck");
		List<BasketDto> orderList = new ArrayList<BasketDto>();
		List<ProductDto> productList = new ArrayList<ProductDto>();
		String userId = principal.getName();
		
		// 유저정보
		UserDto userInfo = userService.getUserByUserId(userId);
		// basketNo로 product가져오기
		for(int i=0; i<arr.length; i++) {
			int basketNo = Integer.parseInt(arr[i]);
			int productCode = basketService.getProductCodeByBasketNo(basketNo);
			ProductDto product = mainService.getProductByProductCode(productCode);
			productList.add(product);
		}
		
		//주문 유효성 검사
		if(arr.length > 0) {
			for(int i=0; i<arr.length; i++) {
				int basketNo = Integer.parseInt(arr[i]);
				BasketDto basket = basketService.getBasketByBasketNo(basketNo);
				orderList.add(basket);
			}
		}
		
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("productList",productList);
		model.addAttribute("orderList",orderList);
		return "order";
	}
	
	@RequestMapping(value="/kakaoPayment", method=RequestMethod.POST)
	@ResponseBody
	public String kakaopay() {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 2b9069293aadf1d01f7e1672e396e57d");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true);
			String parameter = "cid=TC0ONETIME" 
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&item_name=초코파이" 
					+ "&quantity=1" 
					+ "&total_amount=5000" 
					+ "&vat_amount=200" 
					+ "&tax_free_amount=0"
					+ "&approval_url=http://localhost:8083/main" // 결제 성공 시
					+ "&fail_url=http://localhost:8083/basket" // 결제 실패 시
					+ "&cancel_url=http://localhost:8083/faq"; // 결제 취소 시
			OutputStream send = connection.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(parameter);
			dataSend.close();
			
			int result = connection.getResponseCode();
			InputStream receive;
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			InputStreamReader read = new InputStreamReader(receive); 
			BufferedReader change = new BufferedReader(read);
			return change.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";


	}
	
	
}
