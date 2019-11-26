package kr.icia.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.icia.domain.Criteria;
import kr.icia.domain.PageDTO;
import kr.icia.service.ShopService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@Inject
	ShopService service;

	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if (error != null)
			model.addAttribute("error", "계정을 확인해 주세요");
		if (logout != null)
			model.addAttribute("logout", "로그아웃");
	}

	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("custom logout");
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void getNewArrivalsList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getNewArrivalsList(cri));
		int total = service.getCategory00Total(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

//	@PostMapping("/customLogout")
//	public void logoutPost() {
//		log.info("post custom logout");
//	}// 스프링 시큐리티에서 자동 처리하므로, 동작 안하는 구문.
}
