package com.me.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.me.domain.UserApply;
import com.me.service.UserApplyService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/userapply")
public class UserApplyController {

	@Autowired
	private UserApplyService service;

	@Value("${upload.path}")
	private String uploadPath; // 첨부파일 경로

	//등록페이지
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {
		UserApply userApply = new UserApply();
		model.addAttribute(userApply);
		log.info("등록 페이지");
	}
	
	//등록 처리
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(UserApply userApply, RedirectAttributes rttr) throws Exception {
		
		MultipartFile file = userApply.getApplyFile();

		log.info("originalName : " + file.getOriginalFilename());
		log.info("size : " + file.getSize());
		log.info("contentType : " + file.getContentType());

		String createFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

		userApply.setApplyAttachments(createFileName);

		this.service.regsiter(userApply);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		log.info("등록 처리");
		
		return "redirect:/userclassgroup/list";
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
		public ResponseEntity<byte[]> displayFile(Integer applyNum) throws Exception {
			InputStream in = null;
			ResponseEntity<byte[]> entity = null;

			String fileName = service.getApplyFile(applyNum);

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

		
	//목록 페이지
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		model.addAttribute("list", service.list());
	}
}
