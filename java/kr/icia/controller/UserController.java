package kr.icia.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.UserVO;
import kr.icia.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	UserService service;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	// 회원가입 get
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void getSignUp() throws Exception {
		log.info("get signup");
	}

	// 회원가입 post
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String postSignUp(@ModelAttribute UserVO vo, String div, RedirectAttributes rttr,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		log.info("post signup");

		String inputPw = vo.getU_pw();
		String pw = pwEncoder.encode(inputPw);

		vo.setU_pw(pw);
		rttr.addFlashAttribute("result", service.signUp(response, vo));
		return "redirect:/main";
	}

	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		log.info("get login");
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(HttpServletResponse response, UserVO vo, HttpServletRequest req, RedirectAttributes rttr)
			throws Exception {
		log.info("post login");

		UserVO login = service.login(response, vo);
		HttpSession session = req.getSession();

		boolean pwMatch = pwEncoder.matches(vo.getU_pw(), login.getU_pw());

		if (login != null && pwMatch) {
			session.setAttribute("user", login);
		} else if (vo.getU_pw().equals(login.getU_pw())) {
			session.setAttribute("user", login);

		} else {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("message", false);
			return "redirect:/user/login";
		}

		return "redirect:/main";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		log.info("get logout");

		service.logout(session);

		return "redirect:/";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public void checkId(HttpServletResponse response, @RequestParam("u_id") String u_id) throws Exception {
		service.checkId(response, u_id);
	}

	// 이메일 중복 검사
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	public void checkEmail(HttpServletResponse response, @RequestParam("u_email") String u_email) throws Exception {
		service.checkEmail(response, u_email);
	}

//	// 회원 인증
//	@RequestMapping(value = "/approvalUser", method = RequestMethod.GET)
//	public void approvalUser() throws Exception {
//		log.info("get approvaluser");
//	}

	// 회원 인증
	@RequestMapping(value = "/approvalUser", method = RequestMethod.GET)
	public void approvalUser(UserVO vo, HttpServletResponse response) throws Exception {
		service.approvalUser(vo, response);
	}

	// 마이페이지
	@RequestMapping(value = "/myPage/home", method = RequestMethod.GET)
	public void myPage() throws Exception {
		log.info("get myPage");
	}

	@RequestMapping(value = "/myPage/modify", method = RequestMethod.GET)
	public void getModify() throws Exception {
		log.info("get modify");
	}

	// 회원정보 수정 post
	@RequestMapping(value = "/myPage/modify", method = RequestMethod.POST)
	public String postModify(HttpSession session, UserVO vo) throws Exception {
		log.info("post modify");
		String inputPw = vo.getU_pw();
		String pw = pwEncoder.encode(inputPw);

		vo.setU_pw(pw);

		service.modify(vo);

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/myPage/withDrawal", method = RequestMethod.GET)
	public void getWithDrawal() throws Exception {
		log.info("get withdrawal");
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/myPage/withDrawal", method = RequestMethod.POST)
	public String postWithDrawal(HttpSession session, UserVO vo, RedirectAttributes rttr) throws Exception {
		log.info("post withdrawal");

		UserVO user = (UserVO) session.getAttribute("user");

//		String inputPw = vo.getU_pw();
//		String newPass = pwEncoder.encode(inputPw);
//		vo.setU_pw(newPass);
//		boolean oldPass = pwEncoder.matches(pwEncoder.encode(vo.getU_pw()), pwEncoder.encode(user.getU_pw()));

//		String oldPass = user.getU_pw();
//		String newPass = vo.getU_pw();

//		log.info("oldPass : " + oldPass);
//		log.info("newPass : " + newPass);

		if (BCrypt.checkpw(vo.getU_pw(), user.getU_pw())) {
			service.withDrawal(vo);

			session.invalidate();
			return "redirect:/";

		}
		rttr.addFlashAttribute("msg", false);
		return "redirect:/user/myPage/withDrawal";

	}

//	@RequestMapping(value = "/myPage/withDrawal", method = RequestMethod.POST)
//	public String postWithDrawal(@RequestParam String u_pw, Model model, HttpSession session) throws Exception {
//		String u_id = ((UserVO) (session.getAttribute("user"))).getU_id();
//		
//		boolean result = service.checkPw(u_id, u_pw);
//		if (result) {
//			service.withDrawal(u_id);
//			if (result) {
//				session.invalidate(); // 탈퇴 시 로그아웃 처리
//			}
//			return "redirect:/";
//		} else {
//			return "redirect:/user/myPage/withDrawal";
//
//		}
//	}

	// 아이디 찾기 결과 get
	@RequestMapping(value = "/findId_Result", method = RequestMethod.POST)
	public String findId(HttpServletResponse response, @RequestParam("u_email") String u_email, Model model)
			throws Exception {
		model.addAttribute("u_id", service.findId(response, u_email));
		return "/user/findId_Result";
	}

	// 아이디 찾기 get
	@RequestMapping(value = "/findId_Form", method = RequestMethod.GET)
	public void getFindId() throws Exception {
		log.info("get findid");
	}

	// 비밀번호 찾기 get
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public void getFindPw() throws Exception {
		log.info("get findpw");
	}

	// 비밀번호 찾기 post
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public void findPw(@ModelAttribute UserVO vo, HttpServletResponse response) throws Exception {
		service.findPw(response, vo);
	}

}