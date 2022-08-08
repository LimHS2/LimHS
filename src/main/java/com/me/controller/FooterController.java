package com.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/footer")
public class FooterController {

	// 개인정보처리방침
	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String privacy() {
		return "/footer/privacy";
	}

	// 이용약관
	@RequestMapping(value = "/use", method = RequestMethod.GET)
	public String use() {
		return "/footer/use";
	}

	// 극단정보
	@RequestMapping(value = "/troup", method = RequestMethod.GET)
	public String troup() {
		return "/footer/troup";
	}
}
