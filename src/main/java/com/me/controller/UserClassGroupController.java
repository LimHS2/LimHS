package com.me.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.common.domain.CodeLabelValue;
import com.me.common.domain.PageRequest;
import com.me.common.domain.Pagination;
import com.me.service.UserClassGroupService;

@Controller
@RequestMapping("/userclassgroup")
public class UserClassGroupController {

	@Autowired
	private UserClassGroupService service;

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
		searchTypeCodeValueList.add(new CodeLabelValue("t", "제목"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "내용"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(int classNum, Model model) throws Exception {

		model.addAttribute(service.read(classNum));
	}

}
