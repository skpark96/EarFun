package kr.icia.mapper;

import java.util.List;

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

public interface AdminMapper {

	// 카테고리
	public List<CategoryVO> category() throws Exception;

	// 상품 등록
	public void productsRegister(ProductsVO vo) throws Exception;

	// 상품 목록
	public List<ProductsVO> productsList() throws Exception;

	public ProductsVO productsView(int p_id) throws Exception;

	public int productsModify(ProductsVO products) throws Exception;

	public int productsRemove(int p_id) throws Exception;

	public List<UserVO> getList() throws Exception;

	public List<UserVO> getListWithPaging(Criteria cri) throws Exception;

	public List<ProductsVO> getProductsListWithPaging(Criteria cri) throws Exception;

	/* 전체 회원 수 */
	public int getTotalCount(Criteria cri) throws Exception;

	public int getProductsTotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getProductsCategory01ListWithPaging(Criteria cri) throws Exception;

	public int getProductsCategory01TotalCount(Criteria cri) throws Exception;

	public List<ProductsVO> getProductsCategory02ListWithPaging(Criteria cri) throws Exception;

	public int getProductsCategory02TotalCount(Criteria cri) throws Exception;

	/* 공지사항 등록 */
	public void noticeRegister(NoticeVO vo) throws Exception;

	/* 공지사항 목록 */
	public List<NoticeVO> noticeList(Criteria cri) throws Exception;

	public List<NoticeVO> noticePrevList(Criteria cri) throws Exception;

	/* 총 공지사항 글 갯수 */
	public int getNoticeListTotalCount(Criteria cri) throws Exception;

	/* 공지사항 목록 페이징 처리 */
	public List<NoticeVO> getNoticeListWithPaging(Criteria cri) throws Exception;

	/* 공지사항 조회 */
	public NoticeVO noticeView(int n_no) throws Exception;

	/* 공지사항 조회 수 증가 */
	public void updateViewCnt(int n_no) throws Exception;

	/* 공지사항 수정 */
	public void noticeModify(NoticeVO vo) throws Exception;

	/* 공지사항 삭제 */
	public void noticeRemove(int n_no) throws Exception;

	/* 퍼니's 목록 */
	public List<FunnyVO> funnyList(Criteria cri) throws Exception;

	/* 총 퍼니's 글 갯수 */
	public int getFunnyListTotalCount(Criteria cri) throws Exception;

	/* 퍼니's 목록 페이징 처리 */
	public List<FunnyVO> getFunnyListWithPaging(Criteria cri) throws Exception;

	/* 퍼니's 이전/다음글 페이징 처리 */
	public List<FunnyVO> funnyPrevList(Criteria cri) throws Exception;

	/* 퍼니's 조회 */
	public FunnyVO funnyView(int f_no) throws Exception;

	/* 퍼니's 수정 */
	public int funnyModify(FunnyVO vo) throws Exception;

	/* 퍼니's 삭제 */
	public int funnyRemove(int f_no) throws Exception;

	/* 이어펀's 등록 */
	public void earFunRegister(EarFunVO vo) throws Exception;

	/* 이어펀's 목록 */
	public List<EarFunVO> earFunList(Criteria cri) throws Exception;

	/* 총 이어펀's 글 갯수 */
	public int getEarFunListTotalCount(Criteria cri) throws Exception;

	/*
	 * 이어펀's 목록 페이징 처리 public List<EarFunVO> getEarFunListWithPaging(Criteria cri)
	 * throws Exception;
	 */

	/* 이어펀's 이전/다음글 페이징 처리 */
	public List<EarFunVO> earFunPrevList(Criteria cri) throws Exception;

	/* 이어펀's 조회 */
	public EarFunVO earFunView(int e_no) throws Exception;

	/* 이어펀's 수정 */
	public int earFunModify(EarFunVO vo) throws Exception;

	/* 이어펀's 삭제 */
	public int earFunRemove(int e_no) throws Exception;

	/* 상황별 음악 등록 */
	public void moodRegister(MoodVO vo) throws Exception;

	/* 상황별 음악 목록 */
	public List<MoodVO> moodList(Criteria cri) throws Exception;

	/* 총 상황별 음악 글 갯수 */
	public int getMoodListTotalCount(Criteria cri) throws Exception;

	/* 상황별 음악 목록 페이징 처리 */
	public List<MoodVO> getMoodListWithPaging(Criteria cri) throws Exception;

	/* 상황별 음악 이전/다음글 페이징 처리 */
	public List<MoodVO> moodPrevList(Criteria cri) throws Exception;

	/* 상황별 음악 조회 */
	public MoodVO moodView(int m_no) throws Exception;

	/* 상황별 음악 수정 */
	public int moodModify(MoodVO vo) throws Exception;

	/* 상황별 음악 삭제 */
	public int moodRemove(int m_no) throws Exception;

	public List<OrderVO> orderList() throws Exception;

	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	public void status(OrderVO order) throws Exception;

	public void decreaseStock(ProductsVO products) throws Exception;

	public List<ReportVO> getReportListWithPaging(Criteria cri) throws Exception;

	public int getReportTotalCount(Criteria cri) throws Exception;

	public void reportStatus(ReportVO vo) throws Exception;

	public ReportVO reportView(int r_no) throws Exception;

	public void reportRemove(int r_no) throws Exception;

	public List<ReportVO> getUserBlackListWithPaging(Criteria cri) throws Exception;

	public int getUserBlackListTotalCount(Criteria cri) throws Exception;

	List<QnAVO> getQnAListWithPaging(Criteria cri) throws Exception;

	public int getQnATotalCount(Criteria cri) throws Exception;

	QnAVO qnaView(int q_no) throws Exception;

	void qnaReplyRegister(QnAReplyVO vo) throws Exception;

	void qnaStatus(QnAVO qna) throws Exception;

	List<QnAReplyVO> qnaReply(int q_no) throws Exception;
}
