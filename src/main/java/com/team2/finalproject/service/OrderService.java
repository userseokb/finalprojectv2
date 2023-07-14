package com.team2.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.finalproject.mapper.OrderMapper;

@Service
public class OrderService {
	
	@Autowired
	OrderMapper orderMapper;
}
