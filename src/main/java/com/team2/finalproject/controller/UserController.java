package com.team2.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	
	//Bean으로 등록된 BCryptPasswordEncoder 의존성 주입
	private final PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService service;
	
	//getAllUser
	@RequestMapping(value = "/userDetail", method = RequestMethod.GET)
	public String userDetail(Model model) {
		List<UserDto> userList = service.getAllUser();
		
		model.addAttribute("userList", userList);
		
		System.out.println(userList);
		
		return "userDetail";
	}
	
	//insertUser
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUpForm() {
		
		return "signUp";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(@ModelAttribute UserDto newUser, Model model) {
		
		newUser.setUserPw(passwordEncoder.encode(newUser.getUserPw()));
		
		service.insertUser(newUser);
		
		System.out.println(newUser);
				
		return "redirect:login";
	}
	
	//deleteUserByUserNo
	@RequestMapping(value = "/personalInfomation/{userNo}", method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable int userNo) {
		
		service.deleteUserByUserNo(userNo);
		
		return "main";
	}
	
	//userDetail
	@RequestMapping(value = "/personalInfomation/{userNo}", method = RequestMethod.GET)
	public String getUserByUserNo(@PathVariable int userNo, Model model) {
		
		service.getUserByUserNo(userNo);
		
		return "/personalInfomation/{userNo}";
	}
	

	
	@RequestMapping(value = "/personalInfomation/{userNo}", method = RequestMethod.PUT)
	public String updateUser(@PathVariable int userNo,
							@ModelAttribute("email") String email,
							@ModelAttribute("phone") int phone,
							@ModelAttribute("tongsin") String tongsin,
							@ModelAttribute("basicAddr") String basicAddr ,
							@ModelAttribute("detailAddr") String detailAddr) {
		
		UserDto user = service.getUserByUserNo(userNo);
		user.setEmail(email);
		user.setPhone(phone);
		user.setTongsin(tongsin);
		user.setBasicAddr(basicAddr);
		user.setDetailAddr(detailAddr);
		
		System.out.println();
		
		return "/personalInfomation/{userNo}";
		
	}
	
}
