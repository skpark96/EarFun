package kr.icia.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.OrderDetailsVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.PageDTO;
import kr.icia.domain.ProductsVO;
import kr.icia.domain.ReplyListVO;
import kr.icia.domain.ReplyVO;
import kr.icia.domain.UserVO;
import kr.icia.service.ShopService;

@Controller
@RequestMapping("/user/*")
public class ShopController {

	@Inject
	ShopService service;

	@RequestMapping(value = "/shop/categoryTestPage", method = RequestMethod.GET)
	public void getCategoryTestPageList(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory00List(cri));

		int total = service.getCategory00Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category00", method = RequestMethod.GET)
	public void getCategory00List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory00List(cri));

		int total = service.getCategory00Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory00", method = RequestMethod.GET)
	public void getLowPriceCategory00List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory00List(cri));

		int total = service.getCategory00Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory00", method = RequestMethod.GET)
	public void getHighPriceCategory00List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory00List(cri));

		int total = service.getCategory00Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category01", method = RequestMethod.GET)
	public void getCategory01List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory01List(cri));

		int total = service.getCategory01Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory01", method = RequestMethod.GET)
	public void getLowPriceCategory01List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory01List(cri));

		int total = service.getCategory01Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory01", method = RequestMethod.GET)
	public void getHighPriceCategory01List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory01List(cri));

		int total = service.getCategory01Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category02", method = RequestMethod.GET)
	public void getCategory02List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory02List(cri));

		int total = service.getCategory02Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory02", method = RequestMethod.GET)
	public void getLowPriceCategory02List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory02List(cri));

		int total = service.getCategory02Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory02", method = RequestMethod.GET)
	public void getHighPriceCategory02List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory02List(cri));

		int total = service.getCategory02Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category03", method = RequestMethod.GET)
	public void getCategory03List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory03List(cri));

		int total = service.getCategory03Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory03", method = RequestMethod.GET)
	public void getLowPriceCategory03List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory03List(cri));

		int total = service.getCategory03Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory03", method = RequestMethod.GET)
	public void getHighPriceCategory03List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory03List(cri));

		int total = service.getCategory03Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 악세서리
	@RequestMapping(value = "/shop/category10", method = RequestMethod.GET)
	public void getCategory10List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory10List(cri));

		int total = service.getCategory10Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 악세서리
	@RequestMapping(value = "/shop/lowPriceCategory10", method = RequestMethod.GET)
	public void getLowPriceCategory10List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory10List(cri));

		int total = service.getCategory10Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 악세서리
	@RequestMapping(value = "/shop/highPriceCategory10", method = RequestMethod.GET)
	public void getHighPriceCategory10List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory10List(cri));

		int total = service.getCategory10Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category11", method = RequestMethod.GET)
	public void getCategory11List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory11List(cri));

		int total = service.getCategory11Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory11", method = RequestMethod.GET)
	public void getLowPriceCategory11List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory11List(cri));

		int total = service.getCategory11Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory11", method = RequestMethod.GET)
	public void getHighPriceCategory11List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory11List(cri));

		int total = service.getCategory11Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category12", method = RequestMethod.GET)
	public void getCategory12List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory12List(cri));

		int total = service.getCategory12Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory12", method = RequestMethod.GET)
	public void getLowPriceCategory12List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory12List(cri));

		int total = service.getCategory12Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory12", method = RequestMethod.GET)
	public void getHighPriceCategory12List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory12List(cri));

		int total = service.getCategory12Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/category13", method = RequestMethod.GET)
	public void getCategory13List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getCategory13List(cri));

		int total = service.getCategory13Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/lowPriceCategory13", method = RequestMethod.GET)
	public void getLowPriceCategory13List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getLowPriceCategory13List(cri));

		int total = service.getCategory13Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@RequestMapping(value = "/shop/highPriceCategory13", method = RequestMethod.GET)
	public void getHighPriceCategory13List(Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.getHighPriceCategory13List(cri));

		int total = service.getCategory13Total(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 상세 보기 및 후기 목록
	@GetMapping("/shop/shopView")
	public void shopView(Criteria cri, @RequestParam("p_no") int p_no, Model model) throws Exception {
		ProductsVO list = service.shopView(p_no);
		model.addAttribute("list", list);

		int total = service.getReplyTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

//		List<ReplyListVO> reply = service.replyList(p_no);
//		model.addAttribute("reply", reply);
	}

	// 후기 작성
	@RequestMapping(value = "/shop/shopView", method = RequestMethod.POST)
	public String replyRegister(Criteria cri, ReplyVO reply, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		reply.setU_id(user.getU_id());

		service.replyRegister(reply);

		return "redirect:/user/shop/shopView?p_no=" + reply.getP_no();
	}

	// 후기 목록
	@ResponseBody
	@RequestMapping(value = "/shop/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(int p_no) throws Exception {
//		ProductsVO list = service.shopView(p_no);
//		model.addAttribute("list", list);

		List<ReplyListVO> reply = service.replyList(p_no);

		return reply;
	}

	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/shop/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception {
		int result = 0;

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = service.idCheck(reply.getR_no());

		if (user.getU_id().equals(u_id)) {

			reply.setU_id(user.getU_id());
			service.deleteReply(reply);

			result = 1;
		}

		return result;
	}

	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/shop/addCart", method = RequestMethod.POST)
	public int addCart(CartListVO cart, HttpSession session) throws Exception {
		int result = 0;

		UserVO user = (UserVO) session.getAttribute("user");

		if (user != null) {
			cart.setU_id(user.getU_id());
			service.addCart(cart);
			result = 1;
		}

		return result;
	}

	// 장바구니 목록
	@RequestMapping(value = "/shop/cartList", method = RequestMethod.GET)
	public void getCartList(Criteria cri, HttpSession session, Model model) throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();

		List<CartListVO> cartList = service.cartList(u_id);

		model.addAttribute("cartList", cartList);

		int total = service.getCartListTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	// 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/shop/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "checkbox[]") List<String> chArr, CartVO cart)
			throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();

		int result = 0;
		int c_no = 0;

		if (user != null) {
			cart.setU_id(u_id);

			for (String i : chArr) {
				c_no = Integer.parseInt(i);
				cart.setC_no(c_no);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	// 주문하기
	@RequestMapping(value = "/shop/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailsVO orderDetails) throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNo = "";

		for (int i = 1; i <= 6; i++) {
			subNo += (int) (Math.random() * 10);
		}

		String o_id = ymd + "_" + subNo;

		order.setO_id(o_id);
		order.setU_id(u_id);

		service.orderInfo(order);

		orderDetails.setO_id(o_id);
		service.orderInfoDetails(orderDetails);

		service.deleteAllCart(u_id);

		return "redirect:/user/shop/cartList";
	}

	// 주문 조회
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();

		order.setU_id(u_id);

		List<OrderVO> orderList = service.orderList(order);

		model.addAttribute("orderList", orderList);
	}

	// 주문 상세 조회
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, String o_id, OrderVO order, Model model) throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String u_id = user.getU_id();
		order.setU_id(u_id);
		order.setO_id(o_id);

		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}
}
