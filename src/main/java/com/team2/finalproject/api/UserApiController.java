package com.team2.finalproject.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.team2.finalproject.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@RestController
@Slf4j
@RequiredArgsConstructor
public class UserApiController {
	
	private final UserService userService;
	
	//아이디 중복 확인
    @GetMapping("/api/user/idcheck/{userId}")
    public int userIdDuplicateCheck(@PathVariable String userId) throws Exception {
        log.info("id duplicate check call");
        int result = 0;
        result = userService.getUserCountByUserId(userId);
        return result;
    }

}
