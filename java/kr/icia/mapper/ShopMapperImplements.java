package kr.icia.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.icia.domain.CartListVO;
import kr.icia.domain.CartVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.OrderDetailsVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.ProductsVO;
import kr.icia.domain.ReplyListVO;
import kr.icia.domain.ReplyVO;

public class ShopMapperImplements implements ShopMapper {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.icia.mapper.ShopMapper";

	@Override
	public List<ProductsVO> getCategory00ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory00List");
	}

	@Override
	public int getCategory00TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory00TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getCategory01ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory01List");
	}

	@Override
	public int getCategory01TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory01TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getCategory02ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory02List");
	}

	@Override
	public int getCategory02TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory02TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getCategory03ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory03List");
	}

	@Override
	public int getCategory03TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory03TotalCount", cri);
	}

	// 악세서리
	@Override
	public List<ProductsVO> getCategory10ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory10List");
	}

	@Override
	public int getCategory10TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory10TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getCategory11ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory01List");
	}

	@Override
	public int getCategory11TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory01TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getCategory12ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory02List");
	}

	@Override
	public int getCategory12TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory02TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getCategory13ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getCategory03List");
	}

	@Override
	public int getCategory13TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCategory03TotalCount", cri);
	}

	@Override
	public ProductsVO shopView(int p_no) throws Exception {
		return sql.selectOne(namespace + ".shopView", p_no);
	}

	@Override
	public void replyRegister(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".replyRegister", reply);
	}

	@Override
	public List<ReplyListVO> replyList(int p_no) throws Exception {
		return sql.selectList(namespace + ".replyList", p_no);
	}

	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
	}

	@Override
	public String idCheck(int r_no) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", r_no);
	}

	@Override
	public int getReplyTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getReplyTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getLowPriceCategory00ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory00List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory00ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory00List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory01ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory01List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory01ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory01List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory02ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory02List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory02ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory02List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory03ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory03List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory03ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory03List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory10ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory10List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory10ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory10List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory11ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory11List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory11ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory11List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory12ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory12List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory12ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory12List");
	}

	@Override
	public List<ProductsVO> getLowPriceCategory13ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getLowPriceCategory13List");
	}

	@Override
	public List<ProductsVO> getHighPriceCategory13ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getHighPriceCategory13List");
	}

	@Override
	public List<ProductsVO> getNewArrivalsListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getNewArrivalsList");
	}

	// 장바구니
	@Override
	public void addCart(CartListVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	@Override
	public List<CartListVO> cartList(String u_id) throws Exception {
		return sql.selectList(namespace + ".cartList", u_id);
	}

	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	@Override
	public int getCartListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getCartListTotalCount", cri);
	}

	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}

	@Override
	public void orderInfoDetails(OrderDetailsVO orderDetails) throws Exception {
		sql.insert(namespace + ".orderInfoDetails", orderDetails);
	}

	@Override
	public void deleteAllCart(String u_id) throws Exception {
		sql.delete(namespace + ".deleteAllCart", u_id);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

}
