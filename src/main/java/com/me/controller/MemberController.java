package com.me.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.me.domain.Member;
import com.me.service.MemberService;

@Controller
@RequestMapping("/join")
public class MemberController {

	@Autowired
	private MemberService service;

	// 스프링 시큐리티의 비밀번호 암호처리기
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Member member, Model model) throws Exception {

	}

	// 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Validated Member member, BindingResult result, Model model, RedirectAttributes rttr)
			throws Exception {

		member.setUserLevel("일반회원");

		if (result.hasErrors()) {

			return "join/register";
		}

		// 비밀번호 암호화
		String inputPassword = member.getUserPw();
		member.setUserPw(passwordEncoder.encode(inputPassword));

		service.register(member);
		rttr.addFlashAttribute("userName", member.getUserName());

		return "/join/registerSuccess";
	}

	// 등록 성공 페이지
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.GET)
	public void registerSuccess(Model model) throws Exception {

	}

}
