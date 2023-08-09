package kr.spring.introduce.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StadiumController {
	
	
	//구장 소개 폼
	@GetMapping("/introduce/stadium.do")
	public String form() {
		return "stadium"; //tiles 설정
	}
	
}