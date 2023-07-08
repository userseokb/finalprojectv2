package com.team2.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team2.finalproject.dto.user.UserDto;
import com.team2.finalproject.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginIdPwValidator implements UserDetailsService {
	
    private final UserMapper userMapper;
    

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
    	log.info("user Id = {}", userId);
        UserDto user = userMapper.getUserByUserId(userId);
        log.info("user = {}", user);
        if (user == null) {
            throw new AuthenticationServiceException(String.format("아이디나 비밀번호를 찾을 수 없음"));
        }
        String pw = user.getUserPw(); 
        String admin = user.getAdmin(); //"Y or N"

        return User.builder()
                .username(userId)
                .password(pw)
                .roles(admin)
                .build();
    }
}