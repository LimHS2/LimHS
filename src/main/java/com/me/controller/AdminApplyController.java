package com.me.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.me.common.domain.CodeLabelValue;
import com.me.common.domain.PageRequest;
import com.me.common.domain.Pagination;
import com.me.domain.AdminApply;
import com.me.service.AdminApplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/adminapply")
public class AdminApplyController {

	@Autowired
	private AdminApplyService applyService;

	@Value("${upload.path}")
	private String uploadPath; // 첨부파일 경로

	// 등록페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {
		AdminApply adminApply = new AdminApply();
		model.addAttribute(adminApply);
		log.info("등록 페이지");
	}

	// 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(AdminApply adminApply, RedirectAttributes rttr) throws Exception {

		applyService.regsiter(adminApply);

		rttr.addFlashAttribute("msg", "SUCCESS");

		log.info("등록 처리");

		return "redirect:/adminapply/list";
	}

	// 페이징 요청 정보를 매개 변수로 받고 다시 뷰에 전달한다.
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public void list(@ModelAttribute("pgrq") PageRequest pageRequest, Model model) throws Exception {

			// 뷰에 페이징 처리를 한 게시글 목록을 전달한다.
			model.addAttribute("list", applyService.list(pageRequest));

			// 페이징 네비게이션 정보를 뷰에 전달한다.
			Pagination pagination = new Pagination();
			pagination.setPageRequest(pageRequest);

			// 페이지 네비게이션 정보에 검색 처리된 게시글 건수를 저장한다(변경)
			pagination.setTotalCount(applyService.count(pageRequest));
			model.addAttribute("pagination", pagination);

			// 검색 유형의 코드명과 코드값을 정의
			List<CodeLabelValue> searchTypeCodeValueList = new ArrayList<CodeLabelValue>();
			searchTypeCodeValueList.add(new CodeLabelValue("t", "작품명"));
			searchTypeCodeValueList.add(new CodeLabelValue("c", "이름"));
			searchTypeCodeValueList.add(new CodeLabelValue("w", "성별"));

			model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
		}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(Integer applyNum, Model model) throws Exception {
		model.addAttribute(applyService.read(applyNum));
		log.info("상세 페이지");
	}
	
	// 첨부파일
		// spring boot 웹개발 14-1.pdf 참고
		@ResponseBody
		@RequestMapping("/display")
		public ResponseEntity<byte[]> displayFile(Integer applyNum) throws Exception {
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;

			String fileName = applyService.getApplyFile(applyNum);

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
