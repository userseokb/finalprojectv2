package com.team2.finalproject.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.finalproject.dto.order.OrderDetailDto;
import com.team2.finalproject.dto.order.OrderDto;
import com.team2.finalproject.dto.product.BasketDto;
import com.team2.finalproject.dto.product.ProductDto;
import com.team2.finalproject.dto.user.CustomUserDetails;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.service.BasketService;
import com.team2.finalproject.service.MainService;
import com.team2.finalproject.service.OrderService;
import com.team2.finalproject.service.UserService;


@Controller
public class OrderController {

	@Autowired
	BasketService basketService;
	@Autowired
	MainService mainService;
	@Autowired
	UserService userService;
	@Autowired
	OrderService orderService;
	@Value("${kakao.admin}")
	private String kakaoAdminKey; 
	
	private Map<String, Object> jsonData = null;
	private String resData ="";
	//주문 페이지 이동
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String order(HttpServletRequest request, Model model,Principal principal) {
		// 유저정보
		String userId = principal.getName();
		UserDto userInfo = userService.getUserByUserId(userId);
		// request값 전달
		List<ProductDto> productList = basketService.getProductCodeByBasketList(request);
		List<BasketDto> orderList = basketService.getBasketByBasketList(request);
		List<BasketDto> basketList = basketService.getUserBasketByUserNo(userInfo.getUserNo());
		
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("productList",productList);
		model.addAttribute("orderList",orderList);
		model.addAttribute("basketList",basketList);
		return "order";
	}
	
	
	//카카오페이 결제 호출
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/kakaoPayment", method=RequestMethod.POST)
	@ResponseBody
	public String kakaopay(@RequestBody Map<String, Object> payload, Principal pricipal) {
		// 유저 정보 획득
		String userName = pricipal.getName();
		UserDto userInfo = userService.getUserByUserId(userName);
		int userNo = userInfo.getUserNo();
		
		jsonData = payload;
		// json 데이터 형 변환
		int productQuantity = Integer.parseInt(String.valueOf(payload.get("productQuantity")));
		int usedPoint = Integer.parseInt(String.valueOf(payload.get("usedPoint")));
		String basicAddr = String.valueOf(payload.get("basicAddr"));
		String detailAddr = String.valueOf(payload.get("detailAddr"));
		String paymentMethod = String.valueOf(payload.get("paymentMethod"));
		int deliveryCharge = Integer.parseInt(String.valueOf(payload.get("deliveryCharge")));
		int price = Integer.parseInt(String.valueOf(payload.get("price")));
		
		//포인트 사용 유효성검사
		if(userInfo.getPoint() < usedPoint) {
			return "redirect:/basket";
		}
		
		@SuppressWarnings("unchecked")
		List<List<Integer>> productOrderDetail = (List<List<Integer>>) payload.get("productList");
		List<Integer> basketNoArr =(List<Integer>)payload.get("basketNoArr");
		//상품이름 인코딩
		String joinName = String.valueOf(payload.get("joinName"));
		String encodeName ="";
		try {
			encodeName = URLEncoder.encode(joinName,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		
		//카카오페이 결제로직 호출
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK " + kakaoAdminKey);
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true);
			String parameter = "cid=TC0ONETIME" 
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&item_name=" + encodeName 
					+ "&quantity=" + payload.get("productQuantity") 
					+ "&total_amount=" + payload.get("price")
					+ "&tax_free_amount=0"
					+ "&approval_url=http://localhost:8083/payment/approval" // 결제 성공 시
					+ "&fail_url=http://localhost:8083/payment/fail" // 결제 실패 시
					+ "&cancel_url=http://localhost:8083/payment/cancel"; // 결제 취소 시
			OutputStream send = connection.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(parameter);
			dataSend.close();
			
			int result = connection.getResponseCode();
			InputStream receive;
			
			//연결성공
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			InputStreamReader read = new InputStreamReader(receive); 
			BufferedReader change = new BufferedReader(read);
			resData = change.readLine();
			return resData;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";


	}
	
	
	//카카오페이 결제 승인
	@RequestMapping(value="/payment/approval", method=RequestMethod.GET)
	public String approval(@RequestParam("pg_token")String pg_token,HttpServletRequest request, Principal pricipal) {
		// 유저 정보 획득
		String userName = pricipal.getName();
		UserDto userInfo = userService.getUserByUserId(userName);
		int userNo = userInfo.getUserNo();
		
		// json 데이터 형 변환
		int productQuantity = Integer.parseInt(String.valueOf(jsonData.get("productQuantity")));
		int usedPoint = Integer.parseInt(String.valueOf(jsonData.get("usedPoint")));
		String basicAddr = String.valueOf(jsonData.get("basicAddr"));
		String detailAddr = String.valueOf(jsonData.get("detailAddr"));
		String paymentMethod = String.valueOf(jsonData.get("paymentMethod"));
		int deliveryCharge = Integer.parseInt(String.valueOf(jsonData.get("deliveryCharge")));
		int price = Integer.parseInt(String.valueOf(jsonData.get("price")));
		
		@SuppressWarnings("unchecked")
		List<List<Integer>> productOrderDetail = (List<List<Integer>>) jsonData.get("productList");
		List<Integer> basketNoArr =(List<Integer>)jsonData.get("basketNoArr");
		
		
		// tid 추출
		String tid = "";
		String[] splitArr = resData.split(",");
		for(int i=0; i<splitArr.length; i++) {
			String[] keyValue = splitArr[i].split(":");
			if(keyValue[0].contains("tid")) {
				tid = keyValue[1];
			}
		}
		
		//tid 가공
		String encode = String.valueOf(tid).replace("\"", "");
		String encodeTid ="";
		try {
			encodeTid = URLEncoder.encode(encode,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK " + kakaoAdminKey);
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true);

			String parameter = "cid=TC0ONETIME"
					+ "&tid=" + encodeTid
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&pg_token=" + pg_token;
			OutputStream send = connection.getOutputStream();
			DataOutputStream dataSend = new DataOutputStream(send);
			dataSend.writeBytes(parameter);
			dataSend.close();
			
			int result = connection.getResponseCode();
			InputStream receive;
			System.out.println(parameter);
			System.out.println(result);
			if(result == 200) {
				receive = connection.getInputStream();
				
			// 주문생성
			orderService.insertOrder(userNo, productQuantity ,usedPoint, basicAddr,detailAddr,paymentMethod
					,deliveryCharge, price);
			
			// 주문 상세 생성
			int orderNo = orderService.getMaxOrderNoByUserNo(userNo);
			orderService.insertDetailOrder(productOrderDetail,orderNo);
			
			// 장바구니에서 삭제
			basketService.deleteBasketNoArr(basketNoArr);
			
			// 누적금액 갱신
			userService.updateUserBuySum(userNo,price);
			
			//포인트 적립
			userService.updateUserPoint(userNo,price);
			}else {
				receive = connection.getErrorStream(); 
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/main";
	}
	
	
	// 결제중단 큐알코드 닫기
	@RequestMapping(value="/payment/cancel", method=RequestMethod.GET)
	public String paymentCancel() {
		return "redirect:/basket";
	}
	
	
	// 결제 실패
	@RequestMapping(value="/payment/fail", method=RequestMethod.GET)
	public String paymentFail() {
		return "redirect:/basket";
	}
	
	
	@RequestMapping(value="/orderHistory", method=RequestMethod.GET)
	public String orderHistory(Principal principal, Model model,@AuthenticationPrincipal CustomUserDetails cud) {
		String userId = principal.getName();
		UserDto userInfo = userService.getUserByUserId(userId);
		
		List<OrderDto> orderList = orderService.getOrderByUserNo(userInfo.getUserNo());
		List<List<OrderDetailDto>> orderDetailList = orderService.getOrderDetatilByOrder(orderList);
		List<ProductDto> productList = mainService.getProductByOrderDetailList(orderDetailList);
		List<BasketDto> basketList = basketService.getUserBasketByUserNo(cud.getUserNo());
		Collections.reverse(orderList);
		Collections.reverse(orderDetailList);
		Collections.reverse(productList);
		
		model.addAttribute("userInfo",cud);
		model.addAttribute("orderList",orderList);
		model.addAttribute("orderDetailList",orderDetailList);
		model.addAttribute("productList",productList);
		model.addAttribute("basketList",basketList);
		
		return "orderHistory";
	}
	
}
