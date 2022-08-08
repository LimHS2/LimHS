package com.me.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.me.common.domain.CodeLabelValue;
import com.me.common.domain.PageRequest;
import com.me.common.domain.Pagination;
import com.me.common.util.UploadFileUtils;
import com.me.service.UserNoticeService;

@Controller
@RequestMapping("/userNotice")
public class UserNoticeController {

	@Autowired
	private UserNoticeService service;

	@Value("${upload.path}")
	private String uploadPath;

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
		searchTypeCodeValueList.add(new CodeLabelValue("w", "작성자"));

		model.addAttribute("searchTypeCodeValueList", searchTypeCodeValueList);
	}

	// 첨부파일 업로드 처리
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	/* @PreAuthorize("hasRole('ROLE_ADMIN')") */ // 관리자 권한 부여
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());

		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}

	// 상세 페이지
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(int noticeNum, Model model) throws Exception {

		model.addAttribute(service.read(noticeNum));
	}

	// 첨부파일 다운로드 처리
	@ResponseBody
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(String fullName) throws Exception {

		InputStream in = null;

		ResponseEntity<byte[]> entity = null;

		// 첨부파일 다운로드 건수 업데이트
		// service.updateAttachDownCnt(fullName);

		try {
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fullName);

			String fileName = fullName.substring(fullName.indexOf("_") + 1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition",
					"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}

	// 첨부파일 목록 조회
	@ResponseBody
	@RequestMapping("/getAttach/{noticeNum}")
	public List<String> getAttach(@PathVariable("noticeNum") Integer noticeNum) throws Exception {

		return service.getAttach(noticeNum);

	}
	
}
