package com.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/book")
public class BookController {

	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String bookForm() {
		return "/show/bookForm";
	}

}
