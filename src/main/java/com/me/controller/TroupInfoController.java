package com.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TroupInfoController {
	@RequestMapping(value = "/troupInfo", method = RequestMethod.GET)
	public String troupInfo() {
		return "/client/troupInfo/troupInfoDetail";
	}
}
