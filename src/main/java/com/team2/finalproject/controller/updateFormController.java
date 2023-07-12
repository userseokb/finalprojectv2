package com.team2.finalproject.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.finalproject.dto.order.OrderInfoDto;
import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/updateForm")
public class updateFormController {
	
	@Autowired
	private UserService service;
 
@PreAuthorize("isAuthenticated()")
    //마이페이지 창으로 이동
    @GetMapping
    public void profile(Principal principal,Model model) {
        
        log.info("회원정보 변경 창으로 이동");
        log.info("유저아이디: " + principal.getName());
        String userid = principal.getName();
        UserDto user = service.getUserByUserId(userid);
        model.addAttribute("user", user);
        
        System.out.println(user);
    }
}