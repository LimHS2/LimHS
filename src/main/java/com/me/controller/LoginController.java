package com.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class LoginController {

	// 로그인
	@RequestMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "error");
		}
		if (logout != null) {
			model.addAttribute("logout", "logout");
		}
		return "auth/loginForm";
	}

	// 로그아웃.
	@RequestMapping("/logout")
	public String logoutForm() {
		return "auth/logoutForm";
	}
}
