package com.me.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.me.common.domain.CodeLabelValue;
import com.me.common.domain.PageRequest;
import com.me.common.domain.Pagination;
import com.me.domain.AdminShow;
import com.me.service.AdminShowService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/adminshow")
public class AdminShowController {
	@Autowired
	private AdminShowService showService;

	@Value("${upload.path}")
	private String uploadPath; // 첨부파일 경로

	// 등록 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {

		AdminShow adminshow = new AdminShow();

		model.addAttribute(adminshow);
		log.info("공연등록 페이지");
	}

	// 등록 처리(+첨부파일)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(AdminShow adminShow, RedirectAttributes rttr) throws Exception {

		MultipartFile file = adminShow.getShowFile();

		log.info("originalName : " + file.getOriginalFilename());
		log.info("size : " + file.getSize());
		log.info("contentType : " + file.getContentType());

		String createFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

		adminShow.setShowAttachments(createFileName);

		this.showService.register(adminShow);

		rttr.addFlashAttribute("msg", "SUCCESS");

		log.info("등록처리");

		return "redirect:/admin/adminshow/list";
	}

	// 목록 페이지
	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * list(Model model) throws Exception { model.addAttribute("list",
	 * showService.list()); log.info("공연조회 목록"); }
	 */

	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

		// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
		model.addAttribute("list", showService.list(pageRequest));

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPageRequest(pageRequest);

		// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다(변경)
		pagination.setTotalCount(showService.count(pageRequest));
		model.addAttribute("pagination", pagination);

		// 검색 유형의 코드명과 코드값을 정의
		List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
		// searchTypeCodeValueList.add(new CodeLabelValue("n", "---"));
		searchTypeCodeValueList.add(new CodeLabelValue("t", "공연명"));
		searchTypeCodeValueList.add(new CodeLabelValue("c", "출연진"));
		// searchTypeCodeValueList.add(new CodeLabelValue("w", "작성자"));
		// searchTypeCodeValueList.add(new CodeLabelValue("tc", "제목과 내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("cw", "작성자와 내용"));
		// searchTypeCodeValueList.add(new CodeLabelValue("tcw", "제목, 내용, 작성자"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Integer showNum, Model model) throws Exception {
		model.addAttribute(showService.read(showNum));
		log.info("상세 페이지");
	}

	// 수정 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void mofifyForm(Integer showNum, Model model) throws Exception {
		model.addAttribute(showService.read(showNum));
		log.info("수정 페이지");
	}

	// 수정 처리(+첨부파일), 페이징 요청 정보를 매개변수로 받고 다시 뷰에 전달
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(AdminShow adminShow, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		MultipartFile file = adminShow.getShowFile();

		if (file != null && file.getSize() > 0) {
			log.info("originalName : " + file.getOriginalFilename());
			log.info("size : " + file.getSize());
			log.info("contentType : " + file.getContentType());

			String createdFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

			adminShow.setShowAttachments(createdFileName);
		}

		this.showService.modify(adminShow);

		rttr.addFlashAttribute("msg", "SUCCESS");

		log.info("수정처리");

		return "redirect:/admin/adminshow/list";
	}

	// 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(Integer showNum, PageRequest pageRequest, RedirectAttributes rttr) throws Exception {
		showService.remove(showNum);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pageRequest.getPage());
		rttr.addAttribute("sizePerPage", pageRequest.getSizePerPage());

		// 검색 유형과 검색어를 뷰에 전달한다.
		rttr.addAttribute("searchType", pageRequest.getSearchType());
		rttr.addAttribute("keyword", pageRequest.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		log.info("삭제처리");

		return "redirect:/admin/adminshow/list";
	}

	// 첨부파일명 지정
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();

		String createdFileName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, createdFileName);

		FileCopyUtils.copy(fileData, target);

		return createdFileName;
	}

	// 첨부파일
	// spring boot 웹개발 14-1.pdf 참고
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> displayFile(Integer showNum) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		String fileName = showService.getShowFile(showNum);

		log.info("FILE NAME : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + File.separator + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}

	// 첨부파일 MediaType
	private MediaType getMediaType(String formatName) {
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}

			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}

			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
		}
		return null;
	}

}
