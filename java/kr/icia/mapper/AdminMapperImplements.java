package kr.icia.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.EarFunVO;
import kr.icia.domain.FunnyVO;
import kr.icia.domain.MoodVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.OrderListVO;
import kr.icia.domain.OrderVO;
import kr.icia.domain.ProductsVO;
import kr.icia.domain.QnAReplyVO;
import kr.icia.domain.QnAVO;
import kr.icia.domain.ReportVO;
import kr.icia.domain.UserVO;

public class AdminMapperImplements implements AdminMapper {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "kr.icia.mapper.AdminMapper";

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}

	@Override
	public void productsRegister(ProductsVO vo) throws Exception {
		sql.insert(namespace + ".productsRegister", vo);
	}

	@Override
	public List<ProductsVO> productsList() throws Exception {
		return sql.selectList(namespace + ".productsList");
	}

	@Override
	public ProductsVO productsView(int p_id) throws Exception {
		return sql.selectOne(namespace + ".productsView", p_id);
	}

	@Override
	public int productsModify(ProductsVO products) throws Exception {
		return sql.update(namespace + ".productsModify", products);
	}

	@Override
	public int productsRemove(int p_id) throws Exception {
		return sql.delete(namespace + ".productsRemove", p_id);
	}

	@Override
	public List<UserVO> getList() throws Exception {
		return sql.selectList(namespace + ".getList");
	}

	@Override
	public List<UserVO> getListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getListWithPaging");
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getTotalCount", cri);
	}

	@Override
	public int getProductsTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getProductsTotalCount", cri);
	}

	@Override
	public List<ProductsVO> getProductsListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getProductsListWithPaging");
	}

	@Override
	public List<ProductsVO> getProductsCategory01ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".productsCategory01List");
	}

	@Override
	public int getProductsCategory01TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getProductsCategory01TotalCount", cri);
	}

	@Override
	public List<ProductsVO> getProductsCategory02ListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".productsCategory02List");
	}

	@Override
	public int getProductsCategory02TotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getProductsCategory02TotalCount", cri);
	}

	/* 공지사항 등록 */
	@Override
	public void noticeRegister(NoticeVO vo) throws Exception {
		sql.insert(namespace + ".noticeRegister", vo);
	}

	/* 공지사항 목록 */
	@Override
	public List<NoticeVO> noticeList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".noticeList");
	}

	@Override
	public List<NoticeVO> noticePrevList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".noticePrevList");
	}

	/* 총 공지사항 글 갯수 */
	@Override
	public int getNoticeListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getNoticeListTotalCount", cri);
	}

	/* 공지사항 목록 페이징 처리 */
	@Override
	public List<NoticeVO> getNoticeListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getNoticeListWithPaging");
	}

	/* 공지사항 조회 */
	@Override
	public NoticeVO noticeView(int n_no) throws Exception {
		return sql.selectOne(namespace + ".noticeView", n_no);
	}

	/* 공지사항 조회 수 */
	@Override
	public void updateViewCnt(int n_no) throws Exception {
		sql.update(namespace + ".updateViewCnt", n_no);
	}

	/* 공지사항 수정 */
	@Override
	public void noticeModify(NoticeVO vo) throws Exception {
		sql.update(namespace + ".noticeModify", vo);
	}

	/* 공지사항 삭제 */
	@Override
	public void noticeRemove(int n_no) throws Exception {
		sql.delete(namespace + ".noticeRemove", n_no);
	}

	/* 퍼니's 목록 */
	@Override
	public List<FunnyVO> funnyList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".funnyList");
	}

	/* 총 퍼니's 글 갯수 */
	@Override
	public int getFunnyListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getFunnyListTotalCount", cri);
	}

	/* 퍼니's 목록 페이징 처리 */
	@Override
	public List<FunnyVO> getFunnyListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getFunnyListWithPaging");
	}

	/* 퍼니's 이전/다음글 페이징 처리 */
	@Override
	public List<FunnyVO> funnyPrevList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".earFunPrevList");
	}

	/* 퍼니's 조회 */
	@Override
	public FunnyVO funnyView(int f_no) throws Exception {
		return sql.selectOne(namespace + ".funnyView", f_no);
	}

	/* 퍼니's 수정 */
	@Override
	public int funnyModify(FunnyVO vo) throws Exception {
		return sql.update(namespace + ".funnyModify", vo);
	}

	/* 퍼니's 삭제 */
	@Override
	public int funnyRemove(int f_no) throws Exception {
		return sql.delete(namespace + ".funnyRemove", f_no);
	}

	/* 이어펀's 등록 */
	@Override
	public void earFunRegister(EarFunVO vo) throws Exception {
		sql.insert(namespace + ".earFunRegister", vo);
	}

	/* 이어펀's 목록 */
	@Override
	public List<EarFunVO> earFunList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".earFunList");
	}

	/* 총 이어펀's 글 갯수 */
	@Override
	public int getEarFunListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getEarFunListTotalCount", cri);
	}

	/*
	 * 이어펀's 목록 페이징 처리
	 * 
	 * @Override public List<EarFunVO> getEarFunListWithPaging(Criteria cri) throws
	 * Exception { return sql.selectList(namespace + ".getEarFunListWithPaging"); }
	 */

	/* 이어펀's 이전/다음글 페이징 처리 */
	@Override
	public List<EarFunVO> earFunPrevList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".earFunPrevList");
	}

	/* 이어펀's 조회 */
	@Override
	public EarFunVO earFunView(int e_no) throws Exception {
		return sql.selectOne(namespace + ".earFunView", e_no);
	}

	/* 이어펀's 수정 */
	@Override
	public int earFunModify(EarFunVO vo) throws Exception {
		return sql.update(namespace + ".earFunModify", vo);
	}

	/* 이어펀's 삭제 */
	@Override
	public int earFunRemove(int e_no) throws Exception {

		return sql.delete(namespace + ".earFunRemove", e_no);
	}

	/* 상황별 음악 등록 */
	@Override
	public void moodRegister(MoodVO vo) throws Exception {
		sql.insert(namespace + ".moodRegister", vo);
	}

	/* 상황별 음악 목록 */
	@Override
	public List<MoodVO> moodList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".moodList");
	}

	/* 총 상황별 음악 글 갯수 */
	@Override
	public int getMoodListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getMoodListTotalCount", cri);
	}

	/* 상황별 음악 목록 페이징 처리 */
	@Override
	public List<MoodVO> getMoodListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getMoodListWithPaging");
	}

	/* 상황별 음악 이전/다음글 페이징 처리 */
	@Override
	public List<MoodVO> moodPrevList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".moodPrevList");
	}

	/* 상황별 음악 조회 */
	@Override
	public MoodVO moodView(int m_no) throws Exception {
		return sql.selectOne(namespace + ".moodView", m_no);
	}

	/* 상황별 음악 수정 */
	@Override
	public int moodModify(MoodVO vo) throws Exception {
		return sql.update(namespace + ".moodModify", vo);
	}

	/* 상황별 음악 삭제 */
	@Override
	public int moodRemove(int m_no) throws Exception {

		return sql.delete(namespace + ".moodRemove", m_no);
	}

	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

	@Override
	public void status(OrderVO order) throws Exception {
		sql.update(namespace + ".status", order);
	}

	@Override
	public void decreaseStock(ProductsVO products) throws Exception {
		sql.update(namespace + ".decreaseStock", products);
	}

	@Override
	public List<ReportVO> getReportListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getReportListWithPaging");
	}

	@Override
	public int getReportTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getReportTotalCount", cri);
	}

	@Override
	public void reportStatus(ReportVO vo) throws Exception {
		sql.update(namespace + ".reportStatus", vo);

	}

	@Override
	public ReportVO reportView(int r_no) throws Exception {
		return sql.selectOne(namespace + ".reportView", r_no);
	}

	@Override
	public void reportRemove(int r_no) throws Exception {
		sql.delete(namespace + ".reportRemove", r_no);
	}

	@Override
	public List<ReportVO> getUserBlackListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getUserBlackListWithPaging");
	}

	@Override
	public int getUserBlackListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getUserBlackListTotalCount", cri);
	}

	@Override
	public List<QnAVO> getQnAListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getQnAListWithPaging");
	}

	@Override
	public int getQnATotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getQnATotalCount", cri);
	}

	@Override
	public QnAVO qnaView(int q_no) throws Exception {
		return sql.selectOne(namespace + ".qnaView", q_no);
	}

	@Override
	public void qnaReplyRegister(QnAReplyVO vo) throws Exception {
		sql.insert(namespace + ".qnaReplyRegister", vo);
	}

	@Override
	public void qnaStatus(QnAVO qna) throws Exception {
		sql.update(namespace + ".qnaStatus", qna);
	}

	@Override
	public List<QnAReplyVO> qnaReply(int q_no) throws Exception {
		return sql.selectList(namespace + ".qnaReply", q_no);
	}
}
