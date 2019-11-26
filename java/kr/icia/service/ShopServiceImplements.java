package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.OrderDetailsVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.ProductsVO;
import kr.icia.domain.ReplyListVO;
import kr.icia.domain.ReplyVO;
import kr.icia.mapper.ShopMapper;

@Service
public class ShopServiceImplements implements ShopService {

	@Inject
	private ShopMapper mapper;

	@Override
	public List<ProductsVO> getCategory00List(Criteria cri) throws Exception {
		return mapper.getCategory00ListWithPaging(cri);
	}

	@Override
	public int getCategory00Total(Criteria cri) throws Exception {
		return mapper.getCategory00TotalCount(cri);
	}

	@Override
	public List<ProductsVO> getCategory01List(Criteria cri) throws Exception {
		return mapper.getCategory01ListWithPaging(cri);
	}

	@Override
	public int getCategory01Total(Criteria cri) throws Exception {
		return mapper.getCategory01TotalCount(cri);
	}

	@Override
	public List<ProductsVO> getCategory02List(Criteria cri) throws Exception {
		return mapper.getCategory02ListWithPaging(cri);
	}

	@Override
	public int getCategory02Total(Criteria cri) throws Exception {
		return mapper.getCategory02TotalCount(cri);
	}

	@Override
	public List<ProductsVO> getCategory03List(Criteria cri) throws Exception {
		return mapper.getCategory03ListWithPaging(cri);
	}

	@Override
	public int getCategory03Total(Criteria cri) throws Exception {
		return mapper.getCategory03TotalCount(cri);
	}

	// 악세서리
	@Override
	public List<ProductsVO> getCategory10List(Criteria cri) throws Exception {
		return mapper.getCategory10ListWithPaging(cri);
	}

	@Override
	public int getCategory10Total(Criteria cri) throws Exception {
		return mapper.getCategory10TotalCount(cri);
	}

	@Override
	public List<ProductsVO> getCategory11List(Criteria cri) throws Exception {
		return mapper.getCategory11ListWithPaging(cri);
	}

	@Override
	public int getCategory11Total(Criteria cri) throws Exception {
		return mapper.getCategory11TotalCount(cri);
	}

	@Override
	public List<ProductsVO> getCategory12List(Criteria cri) throws Exception {
		return mapper.getCategory12ListWithPaging(cri);
	}

	@Override
	public int getCategory12Total(Criteria cri) throws Exception {
		return mapper.getCategory12TotalCount(cri);
	}

	@Override
	public List<ProductsVO> getCategory13List(Criteria cri) throws Exception {
		return mapper.getCategory13ListWithPaging(cri);
	}

	@Override
	public int getCategory13Total(Criteria cri) throws Exception {
		return mapper.getCategory13TotalCount(cri);
	}

	@Override
	public ProductsVO shopView(int p_no) throws Exception {
		return mapper.shopView(p_no);
	}

	@Override
	public void replyRegister(ReplyVO reply) throws Exception {
		mapper.replyRegister(reply);
	}

	@Override
	public List<ReplyListVO> replyList(int p_no) throws Exception {
		return mapper.replyList(p_no);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		mapper.deleteReply(reply);
	}

	@Override
	public String idCheck(int r_no) throws Exception {
		return mapper.idCheck(r_no);
	}

	@Override
	public int getReplyTotal(Criteria cri) throws Exception {
		return mapper.getReplyTotalCount(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory00List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory00ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory00List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory00ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory01List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory01ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory01List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory01ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory02List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory02ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory02List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory02ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory03List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory03ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory03List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory03ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory10List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory10ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory10List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory10ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory11List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory11ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory11List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory11ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory12List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory12ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory12List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory12ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory13List(Criteria cri) throws Exception {
		return mapper.getLowPriceCategory13ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getHighPriceCategory13List(Criteria cri) throws Exception {
		return mapper.getHighPriceCategory13ListWithPaging(cri);
	}

	@Override
	public List<ProductsVO> getNewArrivalsList(Criteria cri) throws Exception {
		return mapper.getNewArrivalsListWithPaging(cri);
	}

	@Override
	public void addCart(CartListVO cart) throws Exception {
		mapper.addCart(cart);
	}

	@Override
	public List<CartListVO> cartList(String u_id) throws Exception {
		return mapper.cartList(u_id);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		mapper.deleteCart(cart);
	}

	@Override
	public int getCartListTotal(Criteria cri) throws Exception {
		return mapper.getCartListTotalCount(cri);
	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {
		mapper.orderInfo(order);
	}

	@Override
	public void orderInfoDetails(OrderDetailsVO orderDetails) throws Exception {
		mapper.orderInfoDetails(orderDetails);
	}

	@Override
	public void deleteAllCart(String u_id) throws Exception {
		mapper.deleteAllCart(u_id);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return mapper.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return mapper.orderView(order);
	}

}
