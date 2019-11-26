package kr.icia.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.EarFunVO;
import kr.icia.domain.FunnyVO;
import kr.icia.domain.MoodVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.PageDTO;
import kr.icia.domain.ProductsVO;
import kr.icia.domain.QnAReplyVO;
import kr.icia.domain.QnAVO;
import kr.icia.domain.ReportVO;
import kr.icia.service.AdminService;
import kr.icia.utils.UploadFileUtils;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Log4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	AdminService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 관리자 화면 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		log.info("get index");
	}

	/* 상품 등록 GET */
	@RequestMapping(value = "/products/productsRegister", method = RequestMethod.GET)
	public void getProductsRegister(Model model) throws Exception {
		log.info("Get Products Register");

		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	/* 상품 등록 POST */
	@RequestMapping(value = "/products/productsRegister", method = RequestMethod.POST)
	public String postProductsRegister(ProductsVO vo, MultipartFile file) throws Exception {
		String uploadImgPath = uploadPath + File.separator + "uploadImg";
		String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(uploadImgPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setP_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
		vo.setP_thumbImg(File.separator + "uploadImg" + ymdPath 
			+ File.separator + "s" + File.separator + "s_" + fileName);
		
		service.productsRegister(vo);

		return "redirect:/admin/products/productsList";
	}

	/* 상품 목록 GET */
	@RequestMapping(value = "/products/productsList", method = RequestMethod.GET)
	public void getProductsList(Criteria cri, Model model) throws Exception {
		log.info("get products list");

		model.addAttribute("list", service.productsList(cri));

		int total = service.getProductsTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 이어폰/헤드폰 목록 GET */
	@RequestMapping(value = "/products/productsCategory01List", method = RequestMethod.GET)
	public void getProductsCategory01List(Criteria cri, Model model) throws Exception {
		log.info("get products list");

		model.addAttribute("list", service.productsCategory01List(cri));

		int total = service.getProductsCategory01Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 악세서리 목록 GET */
	@RequestMapping(value = "/products/productsCategory02List", method = RequestMethod.GET)
	public void getProductsCategory02List(Criteria cri, Model model) throws Exception {
		log.info("get products list");

		model.addAttribute("list", service.productsCategory02List(cri));

		int total = service.getProductsCategory02Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 상품 상세 보기 */
	@GetMapping({ "/products/productsView", "/products/productsModify" })
	public void productsView(@RequestParam("p_no") int p_no, Model model) throws Exception {
		// @RequestParam : 요청 전달값으로 글번호 이용.
		
		log.info("/get");
		
		model.addAttribute("list", service.productsView(p_no));
		// jsp에서 request.setAttribute 하던 것과 비슷
		// 전달값 명시만 하면 스프링이 자동 처리하고 사용하는 부분만 추가 구현하면 된다.
	}
	
	/* 상품 수정 */
	@PostMapping("/products/productsModify")
	public String productsModify(ProductsVO products, RedirectAttributes rttr, MultipartFile file,
		HttpServletRequest request) throws Exception {

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + request.getParameter("p_image")).delete();
			new File(uploadPath + request.getParameter("p_thumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String uploadImgPath = uploadPath + File.separator + "uploadImg";
			String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
			String fileName = UploadFileUtils.fileUpload(uploadImgPath, 
				file.getOriginalFilename(), file.getBytes(), ymdPath);

			products.setP_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
			products.setP_thumbImg(File.separator + "uploadImg" + ymdPath 
				+ File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면, 기존 이미지를 그대로 사용한다.
			products.setP_image(request.getParameter("p_image"));
			products.setP_thumbImg(request.getParameter("p_thumbImg"));
		}

		if (service.productsModify(products)) {
//			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/products/productsList";
	}

	/* 상품 삭제 POST */
	@PostMapping("/products/productsRemove")
	public String productsRemove(@RequestParam("p_no") int p_no, RedirectAttributes rttr, 
		HttpServletRequest request, String writer, String content) throws Exception {
//		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.productsRemove(p_no)) {
			new File(uploadPath + request.getParameter("p_image")).delete();
			new File(uploadPath + request.getParameter("p_thumbImg")).delete();
//			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/products/productsList";
	}
	
	/* 주문 목록 */
	@RequestMapping(value = "/order/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		List<OrderVO> orderList = service.orderList();

		model.addAttribute("orderList", orderList);
	}

	/* 주문 상세 목록 */
	@RequestMapping(value = "/order/orderView", method = RequestMethod.GET)
	public void getOrderView(String o_id, OrderVO order, Model model) throws Exception {
		order.setO_id(o_id);
		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}

	/* 주문 상세 목록 - 상태 변경 */
	@RequestMapping(value = "/order/orderView", method = RequestMethod.POST)
	public String status(OrderVO order) throws Exception {
		service.status(order);

		List<OrderListVO> orderView = service.orderView(order);
		ProductsVO products = new ProductsVO();

		for (OrderListVO i : orderView) {
			products.setP_no(i.getP_no());
			products.setP_stock(i.getC_stock());
			service.decreaseStock(products);
		}

		return "redirect:/admin/order/orderView?o_id=" + order.getO_id();
	}

	/* 회원 목록 GET */
	@RequestMapping(value = "/user/userList", method = RequestMethod.GET)
	public void getUserList(Criteria cri, Model model) throws Exception {
		log.info("Get Users List");

		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	/* 블랙리스트 목록 GET */
	@RequestMapping(value = "/user/userBlackList", method = RequestMethod.GET)
	public void getUserBlackList(Criteria cri, Model model) throws Exception {
		model.addAttribute("report", service.getUserBlackList(cri));

		int total = service.getUserBlackListTotal(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	/* 신고 내역 목록 GET */
	@RequestMapping(value = "/report/reportList", method = RequestMethod.GET)
	public void getReportList(Criteria cri, Model model) throws Exception {
		model.addAttribute("report", service.reportList(cri));

		int total = service.getReportTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 신고 접수 내역 - 상태 변경 */
	@RequestMapping(value = "/report/reportView", method = RequestMethod.POST)
	public String reportStatus(ReportVO vo) throws Exception {
		service.reportStatus(vo);

		return "redirect:/admin/report/reportList";
	}

	/* 신고 상세 내역 */
	@GetMapping("/report/reportView")
	public void reportView(@RequestParam("r_no") int r_no, Model model) throws Exception {
		model.addAttribute("report", service.reportView(r_no));
	}

	/* 신고 내역 삭제 */
	@PostMapping("/report/reportRemove")
	public String reportRemove(@RequestParam("r_no") int r_no, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		service.reportRemove(r_no);

		return "redirect:/admin/report/reportList";
	}
	
	

	/* 퍼니's 목록 Get */
	@RequestMapping(value = "/board/funnyList", method = RequestMethod.GET)
	public void getFunnyList(Criteria cri, Model model, HttpServletRequest request) throws Exception {

		log.info("Get Funny List");

		model.addAttribute("list", service.funnyList(cri));
		model.addAttribute("prev", service.funnyPrevList(cri));

		int total = service.getFunnyListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 퍼니's 조회 Get */
	@GetMapping({ "/board/funnyView", "/board/funnyModify" })
	public void funnyView(int f_no, Model model) throws Exception {
		log.info("Get Funny View");

		model.addAttribute("list", service.funnyView(f_no));
	}

	/* 퍼니's 수정 Post */
	@PostMapping("/board/funnyModify")
	public String funnyModify(FunnyVO vo, RedirectAttributes rttr, MultipartFile file, HttpServletRequest request)
			throws Exception {
		log.info("Post Funny Modify");

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

		} else { // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용
			vo.setF_image(request.getParameter("f_image"));
			vo.setF_thumbImg(request.getParameter("f_thumbImg"));
		}
		
		if (service.funnyModify(vo)) {
//			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/funnyList";
	}

	/* 퍼니's 삭제 POST */
	@PostMapping("/board/funnyRemove")
	public String funnyRemove(@RequestParam("f_no") int f_no, RedirectAttributes rttr, 
		HttpServletRequest request) throws Exception {
		
		log.info("Post Ear Fun Remove");

		if (service.funnyRemove(f_no)) {
			new File(uploadPath + request.getParameter("f_image")).delete();
			new File(uploadPath + request.getParameter("f_thumbImg")).delete();
			
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/funnyList";
	}

	

	/* 이어펀's 등록 GET */
	@RequestMapping(value = "/board/earFunRegister", method = RequestMethod.GET)
	public void getEarFunRegister() throws Exception {
		log.info("Get Ear Fun Register");
	}

	/* 이어펀's 등록 POST */
	@RequestMapping(value = "/board/earFunRegister", method = RequestMethod.POST)
	public String postEarFunRegister(EarFunVO vo, MultipartFile file) throws Exception {
		log.info("Post Ear Fun Register");
		
		String uploadImgPath = uploadPath + File.separator + "uploadImg";
		String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(uploadImgPath, 
				file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" 
				+ File.separator + "none.png";
		}

		vo.setE_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
		vo.setE_thumbImg(File.separator + "uploadImg" + ymdPath 
			+ File.separator + "s" + File.separator + "s_" + fileName);

		service.earFunRegister(vo);

		return "redirect:/admin/board/earFunList";
	}

	/* 이어펀's 목록 GET */
	@RequestMapping(value = "/board/earFunList", method = RequestMethod.GET)
	public void getEarFunList(Criteria cri, Model model, HttpServletRequest request) throws Exception {

		log.info("Get Ear Fun List");

		model.addAttribute("list", service.earFunList(cri));
		model.addAttribute("prev", service.earFunPrevList(cri));

		int total = service.getEarFunListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 이어펀's 조회 GET */
	@GetMapping({ "/board/earFunView", "/board/earFunModify" })
	public void earFunView(int e_no, Model model) throws Exception {
		log.info("Get Ear Fun View");

		model.addAttribute("list", service.earFunView(e_no));
	}

	/* 이어펀's 수정 POST */
	@PostMapping("/board/earFunModify")
	public String earFunModify(EarFunVO vo, RedirectAttributes rttr, MultipartFile file, HttpServletRequest request)
			throws Exception {
		log.info("Post Ear Fun Modify");
		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + request.getParameter("e_image")).delete();
			new File(uploadPath + request.getParameter("e_thumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String uploadImgPath = uploadPath + File.separator + "uploadImg";
			String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
			String fileName = UploadFileUtils.fileUpload(uploadImgPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setE_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
			vo.setE_thumbImg(
					File.separator + "uploadImg" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setE_image(request.getParameter("e_image"));
			vo.setE_thumbImg(request.getParameter("e_thumbImg"));

		}
		if (service.earFunModify(vo)) {
//			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/earFunList";
	}

	/* 이어펀's 삭제 POST */
	@PostMapping("/board/earFunRemove")
	public String earFunRemove(@RequestParam("e_no") int e_no, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		log.info("Post Ear Fun Remove");

		if (service.earFunRemove(e_no)) {
			new File(uploadPath + request.getParameter("e_image")).delete();
			new File(uploadPath + request.getParameter("e_thumbImg")).delete();
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/earFunList";
	}
	
	

	/* 상황별 음악 등록 GET */
	@RequestMapping(value = "/board/moodRegister", method = RequestMethod.GET)
	public void getMoodRegister() throws Exception {
		log.info("Get Mood Register");
	}

	/* 상황별 음악 등록 POST */
	@RequestMapping(value = "/board/moodRegister", method = RequestMethod.POST)
	public String postMoodRegister(MoodVO vo, MultipartFile file) throws Exception {
		log.info("Post Ear Fun Register");
		String uploadImgPath = uploadPath + File.separator + "uploadImg";
		String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(uploadImgPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setM_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
		vo.setM_thumbImg(
				File.separator + "uploadImg" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		service.moodRegister(vo);

		return "redirect:/admin/board/moodList";
	}

	/* 상황별 음악 목록 GET */
	@RequestMapping(value = "/board/moodList", method = RequestMethod.GET)
	public void getMoodList(Criteria cri, Model model, HttpServletRequest request) throws Exception {
		log.info("Get Mood List");

		model.addAttribute("list", service.moodList(cri));
		model.addAttribute("prev", service.moodPrevList(cri));

		int total = service.getMoodListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 상황별 음악 조회 GET */
	@GetMapping({ "/board/moodView", "/board/moodModify" })
	public void moodView(int m_no, Model model) throws Exception {
		log.info("Get Mood View");

		model.addAttribute("list", service.moodView(m_no));
	}

	/* 상황별 음악 수정 POST */
	@PostMapping("/board/moodModify")
	public String moodModify(MoodVO vo, RedirectAttributes rttr, MultipartFile file, 
		HttpServletRequest request) throws Exception {
		
		log.info("Post Mood Modify");
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + request.getParameter("m_image")).delete();
			new File(uploadPath + request.getParameter("m_thumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String uploadImgPath = uploadPath + File.separator + "uploadImg";
			String ymdPath = UploadFileUtils.calcPath(uploadImgPath);
			String fileName = UploadFileUtils.fileUpload(uploadImgPath, 
				file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setM_image(File.separator + "uploadImg" + ymdPath + File.separator + fileName);
			vo.setM_thumbImg(File.separator + "uploadImg" + ymdPath 
				+ File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용
			vo.setM_image(request.getParameter("m_image"));
			vo.setM_thumbImg(request.getParameter("m_thumbImg"));
		}
		if (service.moodModify(vo)) {
//			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/moodList";
	}

	/* 상황별 음악 삭제 POST */
	@PostMapping("/board/moodRemove")
	public String moodRemove(@RequestParam("m_no") int m_no, RedirectAttributes rttr, 
		HttpServletRequest request) throws Exception {
		
		log.info("Post Mood Remove");

		if (service.moodRemove(m_no)) {
			new File(uploadPath + request.getParameter("m_image")).delete();
			new File(uploadPath + request.getParameter("m_thumbImg")).delete();
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/board/moodList";
	}
	
	
	
	/* 공지사항 등록 GET */
	@RequestMapping(value = "/board/noticeRegister", method = RequestMethod.GET)
	public void getNoticeRegister() throws Exception {
		log.info("Get Notice Register");
	}

	/* 공지사항 등록 POST */
	@RequestMapping(value = "/board/noticeRegister", method = RequestMethod.POST)
	public String postNoticeRegister(NoticeVO vo) throws Exception {
		log.info("Post Notice Register");

		service.noticeRegister(vo);

		return "redirect:/admin/board/noticeList";
	}

	/* 공지사항 목록 GET */
	@RequestMapping(value = "/board/noticeList", method = RequestMethod.GET)
	public void getNoticeList(Criteria cri, Model model, HttpServletRequest request) throws Exception {
		log.info("Get Notice List");

		model.addAttribute("list", service.noticeList(cri));
		model.addAttribute("prev", service.noticePrevList(cri));

		int total = service.getNoticeListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 공지사항 조회 GET */
	@GetMapping({ "/board/noticeView", "/board/noticeModify" })
	public void noticeView(int n_no, Model model) throws Exception {
		log.info("Get Notice View");

		model.addAttribute("list", service.noticeView(n_no));
	}

	/* 공지사항 수정 Post */
	@PostMapping("/board/noticeModify")
	public String noticeModify(NoticeVO vo) throws Exception {
		log.info("Post Notice Modify");

		service.noticeModify(vo);

		return "redirect:/admin/board/noticeList";
	}

	/* 공지사항 삭제 Post */
	@PostMapping("/board/noticeRemove")
	public String noticeRemove(@RequestParam("n_no") int n_no) throws Exception {
		log.info("Post Notice Remove");

		service.noticeRemove(n_no);

		return "redirect:/admin/board/noticeList";
	}

	/* 1:1 문의 목록 */
	@RequestMapping(value = "/board/qnaList", method = RequestMethod.GET)
	public void getQnAList(Criteria cri, Model model, HttpServletRequest request) throws Exception {

		model.addAttribute("list", service.qnaList(cri));

		int total = service.getQnAListTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	/* 1:1 문의 내역 조회 GET */
	@GetMapping("/board/qnaView")
	public void qnaView(int q_no, Model model) throws Exception {
		model.addAttribute("list", service.qnaView(q_no));
	}

	/* 1:1 문의 내역 조회 POST */ 
	@RequestMapping(value = "/board/qnaView", method = RequestMethod.POST)
	public String qnaReplyRegister(QnAVO qna, QnAReplyVO vo, HttpSession session) throws Exception {
		service.qnaStatus(qna);
		service.qnaReplyRegister(vo);

		return "redirect:/admin/board/qnaList";
	}

	/* 1:1 문의 답변 */
	@ResponseBody
	@RequestMapping(value = "/board/qnaReply", method = RequestMethod.GET)
	public List<QnAReplyVO> getQnAReply(int q_no) throws Exception {
		List<QnAReplyVO> reply = service.qnaReply(q_no);

		return reply;
	}
	
} // end of class