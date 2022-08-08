package com.me.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.me.common.domain.CodeLabelValue;
import com.me.common.domain.PageRequest;
import com.me.common.domain.Pagination;
import com.me.domain.AdminMember;
import com.me.service.AdminMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/adminmember")
public class AdminMemberContoller {
	@Autowired
	private AdminMemberService memberService;

	// 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {

		AdminMember admember = new AdminMember();

		model.addAttribute(admember);
		log.info("등록 페이지");
	}

	// 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(AdminMember admember, RedirectAttributes rttr) throws Exception {

		memberService.register(admember);

		rttr.addFlashAttribute("msg", "SUCCESS");

		log.info("등록처리");

		return "redirect:/admin/adminmember/list";
	}

	// 목록 페이지
	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * list(Model model) throws Exception { model.addAttribute("list",
	 * memberService.list()); log.info("목록"); }
	 */

	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("list", memberService.list(pageRequest));

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다(변경)
		pagination.setTotalCount(memberService.count(pageRequest));
		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		// searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "회원이름"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "등급"));
		searchTypeCodeValueList.add(new CodeLabelValue("w", "성별"));
		// searchTypeCodeValueList.add(new CodeLabelValue("tc", "제목과 내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("cw", "작성자와 내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("tcw", "제목, 내용, 작성자"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Integer userNo, Model model) throws Exception {
		model.addAttribute(memberService.read(userNo));
		log.info("상세 페이지");
	}

	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void mofifyForm(Integer userNo, Model model) throws Exception {
		model.addAttribute(memberService.read(userNo));
		log.info("수정 페이지");
	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(AdminMember admember, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {

		memberService.modify(admember);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");
		log.info("수정처리");

		return "redirect:/admin/adminmember/list";
	}

	// 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(Integer userNo, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		memberService.remove(userNo);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		log.info("삭제처리");

		return "redirect:/admin/adminmember/list";
	}
}
