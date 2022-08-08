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
import com.me.domain.ClassGroup;
import com.me.service.ClassGroupService;

@Controller
@RequestMapping("/admin/classgroup")
public class ClassGroupController {

	@Autowired
	private ClassGroupService service;

	// 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {
		ClassGroup classGroup = new ClassGroup();

		model.addAttribute(classGroup);
	}

	// 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(ClassGroup classGroup, 
			RedirectAttributes rttr) throws Exception {
		
		service.register(classGroup);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/admin/classgroup/list";
	}

	// 목록 페이지
	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * list(Model model) throws Exception {
	 * 
	 * model.addAttribute("list", service.list()); }
	 */

	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("list", service.list(pageRequest));

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다(변경)
		pagination.setTotalCount(service.count(pageRequest));
		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		// searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "제목"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("w", "작성자"));
		// searchTypeCodeValueList.add(new CodeLabelValue("tc", "제목과 내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("cw", "작성자와 내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("tcw", "제목, 내용, 작성자"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(int classNum, Model model) throws Exception {

		model.addAttribute(service.read(classNum));
	}

	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyForm(int classNum, Model model) throws Exception {

		model.addAttribute(service.read(classNum));
	}

	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(ClassGroup classGroup, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.modify(classGroup);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/classgroup/list";
	}

	// 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(int classNum, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		service.remove(classNum);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/admin/classgroup/list";
	}

}
