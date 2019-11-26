package kr.icia.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.Criteria;
import kr.icia.domain.EarFunReplyListVO;
import kr.icia.domain.EarFunReplyVO;
import kr.icia.domain.FunnyLikeVO;
import kr.icia.domain.FunnyReplyListVO;
import kr.icia.domain.FunnyReplyVO;
import kr.icia.domain.FunnyVO;
import kr.icia.domain.MoodReplyListVO;
import kr.icia.domain.MoodReplyVO;
import kr.icia.domain.PageDTO;
import kr.icia.domain.QnAVO;
import kr.icia.domain.ReportVO;
import kr.icia.domain.UserVO;
import kr.icia.service.BoardService;
import kr.icia.utils.UploadFileUtils;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 퍼니's 등록 Get */
	@RequestMapping(value = "/funnyRegister", method = RequestMethod.GET)
	public void getFunnyRegister() throws Exception {
		log.info("Get Funny Register");
	}

	/* 퍼니's 등록 Post */
	@RequestMapping(value = "/funnyRegister", method = RequestMethod.POST)
	public String postFunnyRegister(@ModelAttribute FunnyVO vo, MultipartFile file, HttpSession session)
			throws Exception {
		log.info("Post Funny Register");

		UserVO user = (UserVO) session.getAttribute("user");
		vo.setU_id(user.getU_id());

		String writer = (String) session.getAttribute("mod_user");
		vo.setWriter(writer);

		String uploadImgPath = uploadPath + File.separator + "uploadImg";
		String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(uploadImgPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setF_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
		vo.setF_thumbImg(
				File.separator + "uploadImg" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		service.funnyRegister(vo);

		return "redirect:/user/board/funnyList";
	}

	/* 퍼니's 목록 */
	@RequestMapping(value = "/funnyList", method = RequestMethod.GET)
	public void getFunnyList(Criteria cri, Model model, HttpServletRequest request) throws Exception {

		log.info("Get Funny List");

		model.addAttribute("list", service.funnyList(cri));
		model.addAttribute("prev", service.funnyPrevList(cri));

		int total = service.getFunnyListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 퍼니's 조회 Get */
	@GetMapping({ "/funnyView", "/funnyModify" })
	public void funnyView(int f_no, FunnyLikeVO like, Criteria cri, Model model, HttpSession session) throws Exception {
		log.info("Get Funny View");

		UserVO user = (UserVO) session.getAttribute("user");
		like.setU_id(user.getU_id());

		model.addAttribute("count", service.funnyLikeCount(f_no));
		model.addAttribute("list", service.funnyView(f_no));
		model.addAttribute("like", service.funnyLikeView(like));

		/* int total = service.getFunnyLikeTotalCount(cri); */

		/* model.addAttribute("pageMaker", new PageDTO(cri, total)); */

		/* model.addAttribute("report", service.funnyReportInfo(r_no)); */
	}

	/* 퍼니's 수정 Post */
	@PostMapping("/funnyModify")
	public String funnyModify(FunnyVO vo, RedirectAttributes rttr, MultipartFile file, HttpServletRequest request)
			throws Exception {
		log.info("Post Funny Modify");

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + request.getParameter("f_image")).delete();
			new File(uploadPath + request.getParameter("f_thumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String uploadImgPath = uploadPath + File.separator + "uploadImg";
			String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
			String fileName = UploadFileUtils.fileUpload(uploadImgPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setF_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
			vo.setF_thumbImg(
					File.separator + "uploadImg" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setF_image(request.getParameter("f_image"));
			vo.setF_thumbImg(request.getParameter("f_thumbImg"));
		}

		if (service.funnyModify(vo)) {
//	            deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/user/board/funnyList";
	}

	/* 퍼니's 삭제 Post */
	@PostMapping("/funnyRemove")
	public String funnyRemove(@RequestParam("f_no") int f_no, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		log.info("Post Ear Fun Remove");

		if (service.funnyRemove(f_no)) {
			new File(uploadPath + request.getParameter("f_image")).delete();
			new File(uploadPath + request.getParameter("f_thumbImg")).delete();
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/user/board/funnyList";
	}

	@PostMapping("/funnyLikeRemove")
	public String funnyLikeRemove(FunnyLikeVO like, FunnyVO vo, HttpSession session) throws Exception {
		log.info("Post Ear Fun Remove");

		UserVO user = (UserVO) session.getAttribute("user");
		like.setU_id(user.getU_id());

		service.funnyLikeRemove(like);

		return "redirect:/user/board/funnyView?f_no=" + vo.getF_no();
	}

	/* 퍼니's 댓글 작성 Post */
	@RequestMapping(value = "/funnyView", method = RequestMethod.POST)
	public String replyRegister(Criteria cri, FunnyReplyVO reply, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		reply.setU_id(user.getU_id());

		service.funnyReplyRegister(reply);

		return "redirect:/user/board/funnyView?f_no=" + reply.getF_no();
	}

	/* 퍼니's 댓글 목록 Get */
	@ResponseBody
	@RequestMapping(value = "/funnyReplyList", method = RequestMethod.GET)
	public List<FunnyReplyListVO> getFunnyReplyList(int f_no) throws Exception {
		List<FunnyReplyListVO> reply = service.funnyReplyList(f_no);

		return reply;
	}

	/* 퍼니's 신고 정보 Get */
	@RequestMapping(value = "/funnyReportInfo", method = RequestMethod.GET)
	public List<FunnyReplyListVO> getFunnyReportInfo(int r_no, Model model) throws Exception {
		List<FunnyReplyListVO> report = service.funnyReportInfo(r_no);
		model.addAttribute("report", service.funnyReportInfo(r_no));
		return report;
	}

	/* 퍼니's 신고 Post */
	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public String report(@ModelAttribute ReportVO vo) throws Exception {
		service.report(vo);
		return "redirect:/user/board/funnyList";
	}

	@RequestMapping(value = "/funnyLikeRegister", method = RequestMethod.POST)
	public String funnyLikeRegister(FunnyLikeVO like, FunnyVO vo, HttpSession session) throws Exception {
		log.info("Post Ear Fun Register");

		UserVO user = (UserVO) session.getAttribute("user");
		like.setU_id(user.getU_id());

		service.funnyLikeRegister(like);

		return "redirect:/user/board/funnyView?f_no=" + vo.getF_no();
	}

	@RequestMapping(value = "/myMusic", method = RequestMethod.GET)
	public void getMyMusicList(Criteria cri, HttpSession session, Model model) throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();

		List<FunnyVO> music = service.myMusic(u_id);

		model.addAttribute("music", music);

		int total = service.getMyMusicListTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 이어펀's 목록 Get */
	@RequestMapping(value = "/earFunList", method = RequestMethod.GET)
	public void getEarFunList(Criteria cri, Model model, HttpServletRequest request) throws Exception {

		log.info("Get Ear Fun List");

		model.addAttribute("list", service.earFunList(cri));
		model.addAttribute("prev", service.earFunPrevList(cri));

		int total = service.getEarFunListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 이어펀's 조회 Get */
	@GetMapping("/earFunView")
	public void earFunView(@RequestParam("e_no") int e_no, Criteria cri, Model model) throws Exception {
		log.info("Get Ear Fun View");

		model.addAttribute("list", service.earFunView(e_no));

//      model.addAttribute("reply", service.earFunReplyList(e_no));

		int total = service.getEarFunReplyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 이어펀's 댓글 작성 Post */
	@RequestMapping(value = "/earFunView", method = RequestMethod.POST)
	public String replyRegister(Criteria cri, EarFunReplyVO reply, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		reply.setU_id(user.getU_id());

		service.earFunReplyRegister(reply);

		return "redirect:/user/board/earFunView?e_no=" + reply.getE_no();
	}

	/* 이어펀's 댓글 목록 Get */
	@ResponseBody
	@RequestMapping(value = "/earFunReplyList", method = RequestMethod.GET)
	public List<EarFunReplyListVO> getEarFunReplyList(int e_no) throws Exception {
		List<EarFunReplyListVO> reply = service.earFunReplyList(e_no);

		return reply;
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 상황별 음악 목록 Get */
	@RequestMapping(value = "/moodList", method = RequestMethod.GET)
	public void getMoodList(Criteria cri, Model model, HttpServletRequest request) throws Exception {

		log.info("Get Mood List");

		model.addAttribute("list", service.moodList(cri));
		model.addAttribute("prev", service.moodPrevList(cri));

		int total = service.getMoodListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 상황별 음악 조회 Get */
	@GetMapping("/moodView")
	public void moodView(int m_no, Model model) throws Exception {
		log.info("Get Mood View");

		model.addAttribute("list", service.moodView(m_no));
	}

	/* 상황별 음악 댓글 작성 Post */
	@RequestMapping(value = "/moodView", method = RequestMethod.POST)
	public String replyRegister(Criteria cri, MoodReplyVO reply, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		reply.setU_id(user.getU_id());

		service.moodReplyRegister(reply);

		return "redirect:/user/board/moodView?m_no=" + reply.getM_no();
	}

	/* 상황별 음악 댓글 목록 Get */
	@ResponseBody
	@RequestMapping(value = "/moodReplyList", method = RequestMethod.GET)
	public List<MoodReplyListVO> getMoodReplyList(int m_no) throws Exception {
		List<MoodReplyListVO> reply = service.moodReplyList(m_no);

		return reply;
	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 공지사항 목록 Get */
	@RequestMapping(value = "/userNoticeList", method = RequestMethod.GET)
	public void getNoticeList(Criteria cri, Model model) throws Exception {
		log.info("Get User Notice List");

		model.addAttribute("list", service.userNoticeList(cri));

		int total = service.getUserNoticeListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 공지사항 조회 Get */
	@GetMapping("/userNoticeView")
	public void userNoticeView(int n_no, Model model) throws Exception {
		log.info("Get Notice View");

		model.addAttribute("list", service.userNoticeView(n_no));
	}

	/* QnA */
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.POST)
	public String postQnARegister(QnAVO vo, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setQ_writer(user.getU_id());
		service.qnaRegister(vo);

		return "redirect:/user/board/qnaRegister";
	}

	/* QnA */
	@RequestMapping(value = "/qnaRegister", method = RequestMethod.GET)
	public void getQnARegister(QnAVO vo) throws Exception {

	}

	/* QnA 목록 */
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public void getQnAList(Criteria cri, HttpSession session, Model model) throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();

		List<QnAVO> qnaList = service.qnaList(u_id);

		model.addAttribute("list", qnaList);
	}

	@GetMapping("/qnaView")
	public void qnaView(int q_no, Model model) throws Exception {

		model.addAttribute("reply", service.qnaReplyView(q_no));

		model.addAttribute("list", service.qnaView(q_no));
	}

} // end of class