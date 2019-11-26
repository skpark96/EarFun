package kr.icia.mapper;

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

public interface ShopMapper {

	public List<ProductsVO> getCategory00ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory00ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory00ListWithPaging(Criteria cri) throws Exception;

	public int getCategory00TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getCategory01ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory01ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory01ListWithPaging(Criteria cri) throws Exception;

	public int getCategory01TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getCategory02ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory02ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory02ListWithPaging(Criteria cri) throws Exception;

	public int getCategory02TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getCategory03ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory03ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory03ListWithPaging(Criteria cri) throws Exception;

	public int getCategory03TotalCount(Criteria cri) throws Exception;

	// 악세서리
	public List<ProductsVO> getCategory10ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory10ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory10ListWithPaging(Criteria cri) throws Exception;

	public int getCategory10TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getCategory11ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory11ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory11ListWithPaging(Criteria cri) throws Exception;

	public int getCategory11TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getCategory12ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory12ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory12ListWithPaging(Criteria cri) throws Exception;

	public int getCategory12TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getCategory13ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getLowPriceCategory13ListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getHighPriceCategory13ListWithPaging(Criteria cri) throws Exception;

	public int getCategory13TotalCount(Criteria cri) throws Exception;

	public ProductsVO shopView(int p_no) throws Exception;

	// 후기 작성
	public void replyRegister(ReplyVO reply) throws Exception;

	// 후기 목록
	public List<ReplyListVO> replyList(int p_no) throws Exception;

	// 후기 삭제
	public void deleteReply(ReplyVO reply) throws Exception;

	// 후기 삭제 시 아이디 체크
	public String idCheck(int r_no) throws Exception;

	public int getReplyTotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getNewArrivalsListWithPaging(Criteria cri) throws Exception;

	// 장바구니
	public void addCart(CartListVO cart) throws Exception;

	// 장바구니 목록
	public List<CartListVO> cartList(String u_id) throws Exception;

	public void deleteCart(CartVO cart) throws Exception;

	public int getCartListTotalCount(Criteria cri) throws Exception;

	public void orderInfo(OrderVO order) throws Exception;

	public void orderInfoDetails(OrderDetailsVO orderDetails) throws Exception;

	public void deleteAllCart(String u_id) throws Exception;

	public List<OrderVO> orderList(OrderVO order) throws Exception;

	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
