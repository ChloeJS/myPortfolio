package com.gallery;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.imageio.plugins.tiff.GeoTIFFTagSet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.file.FileVO;

import lombok.AllArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@AllArgsConstructor
public class GalleryController {

	@Autowired
	GalleryService gService;

	// 목록 ==================================
	@ResponseBody
	@GetMapping("/portfolio/gallery/list.do")
	public List<GalleryVO> index(GalleryVO vo, Model model) {
		List<GalleryVO> gList = gService.list(vo);
		model.addAttribute("lists", gList);
		return gList;
	}

	@GetMapping("/portfolio/gallery/index.do")
	public String list(GalleryVO vo, Model model) {
		//System.out.println("리스트 나와라 ====================" + gService.list(vo));
		model.addAttribute("lists", gService.list(vo));
		return "portfolio/gallery/index";
	}

	@ResponseBody
	@GetMapping("/portfolio/gallery/view.do")
	public GalleryVO view(GalleryVO vo, int gallery_no, Model model) {
		// System.out.println(vo.getGallery_no());
		// System.out.println("제발 나와라 =======================" +
		// gService.view(vo.getGallery_no()));
		model.addAttribute("view", gService.view(vo.getGallery_no()));
		return gService.view(gallery_no);
	}

	// 등록 ==================================
	@GetMapping("/portfolio/gallery/write.do")
	public String write(GalleryVO vo) {
		return "portfolio/gallery/write";
	}

	@PostMapping("/portfolio/gallery/write.do")
	public String insert(GalleryVO vo, Model model, @RequestParam MultipartFile filename, HttpServletRequest req) throws Exception {

		if (!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime() + ext;

			String path = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(path + real));
			} catch (Exception e) {
			}
			vo.setFilename_org(org);
			vo.setFilename_real(real);
		}

		if (gService.insert(vo)) {
			model.addAttribute("message", "정상적으로 등록되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "등록 실패했습니다.");
			return "common/alert";
		}
	}
	
	// 수정폼 ==============================
	@GetMapping("/portfolio/gallery/edit.do")
	public String edit(GalleryVO vo, Model model) {
		System.out.println("==============================="+gService.view(vo.getGallery_no()));
		model.addAttribute("data", gService.view(vo.getGallery_no()));
		return "portfolio/gallery/edit";
	}
	
	// 수정처리 =============================
	@PostMapping("/portfolio/gallery/edit.do")
	public String update(GalleryVO vo, Model model, @RequestParam MultipartFile filename, HttpServletRequest req) throws Exception {
		System.out.println("=======================사진"+vo.getFilename_org());
		
		if (!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime() + ext;

			String path = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(path + real));
			} catch (Exception e) {
			}
			vo.setFilename_org(org);
			vo.setFilename_real(real);
		}
		
		if (gService.update(vo)) {
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "수정 실패했습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		}
	}
	
	// 삭제 ==============================
	@GetMapping("/portfolio/gallery/delete.do")
	public String delete(int gallery_no, Model model) {
		if (gService.delete(gallery_no)) {
			model.addAttribute("message", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		} else {
			model.addAttribute("message", "삭제 실패했습니다. 다시 시도해주세요.");
			return "common/alert";
		}
	}
	
	// 팀프로젝트 ppt 출력
	@GetMapping("/project/ppt.do")
	public String ppt() {
		return "project/ppt";
	}
	
	// 개인프로젝트 포폴 출력
	@GetMapping("/myinfo/myppt.do")
	public String myppt() {
		return "myinfo/myppt";
	}
}
