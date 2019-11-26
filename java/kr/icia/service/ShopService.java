package kr.icia.service;

import java.util.List;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.OrderDetailsVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.ProductsVO;
import kr.icia.domain.ReplyListVO;
import kr.icia.domain.ReplyVO;

public interface ShopService {

	public List<ProductsVO> getNewArrivalsList(Criteria cri) throws Exception;

	// 1차 : 이어폰/헤드폰
	public List<ProductsVO> getCategory00List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory00List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory00List(Criteria cri) throws Exception;

	public int getCategory00Total(Criteria cri) throws Exception;

	// 2차 : 이어폰
	public List<ProductsVO> getCategory01List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory01List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory01List(Criteria cri) throws Exception;

	public int getCategory01Total(Criteria cri) throws Exception;

	// 2차 : 헤드폰
	public List<ProductsVO> getCategory02List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory02List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory02List(Criteria cri) throws Exception;

	public int getCategory02Total(Criteria cri) throws Exception;

	// 2차 : 블루투스
	public List<ProductsVO> getCategory03List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory03List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory03List(Criteria cri) throws Exception;

	public int getCategory03Total(Criteria cri) throws Exception;

	// 1차 : 악세서리
	public List<ProductsVO> getCategory10List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory10List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory10List(Criteria cri) throws Exception;

	public int getCategory10Total(Criteria cri) throws Exception;

	// 2차 : 케이블
	public List<ProductsVO> getCategory11List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory11List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory11List(Criteria cri) throws Exception;

	public int getCategory11Total(Criteria cri) throws Exception;

	// 2차 : 케이스/파우치
	public List<ProductsVO> getCategory12List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory12List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory12List(Criteria cri) throws Exception;

	public int getCategory12Total(Criteria cri) throws Exception;

	// 2차 : 청소도구
	public List<ProductsVO> getCategory13List(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory13List(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory13List(Criteria cri) throws Exception;

	public int getCategory13Total(Criteria cri) throws Exception;

	public ProductsVO shopView(int p_no) throws Exception;

	// 후기 작성
	public void replyRegister(ReplyVO reply) throws Exception;

	// 후기 목록
	public List<ReplyListVO> replyList(int p_no) throws Exception;

	// 후기 삭제
	public void deleteReply(ReplyVO reply) throws Exception;

	// 후기 삭제 시 아이디 체크
	public String idCheck(int r_no) throws Exception;

	public int getReplyTotal(Criteria cri) throws Exception;

	// 장바구니
	public void addCart(CartListVO cart) throws Exception;

	// 장바구니 목록
	public List<CartListVO> cartList(String u_id) throws Exception;

	public void deleteCart(CartVO cart) throws Exception;

	public int getCartListTotal(Criteria cri) throws Exception;

	public void orderInfo(OrderVO order) throws Exception;

	public void orderInfoDetails(OrderDetailsVO orderDetails) throws Exception;

	public void deleteAllCart(String u_id) throws Exception;

	public List<OrderVO> orderList(OrderVO order) throws Exception;

	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
