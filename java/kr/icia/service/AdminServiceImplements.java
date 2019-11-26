package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import kr.icia.mapper.AdminMapper;
import kr.icia.mapper.AttachMapper;
import lombok.Setter;

@Service
public class AdminServiceImplements implements AdminService {

	@Inject
	private AdminMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private AttachMapper attachMapper;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return mapper.category();
	}

	@Override
	public void productsRegister(ProductsVO vo) throws Exception {
		mapper.productsRegister(vo);
	}

	@Override
	public List<ProductsVO> productsList(Criteria cri) throws Exception {
		return mapper.getProductsListWithPaging(cri);
	}

	@Override
	public ProductsVO productsView(int p_id) throws Exception {
		return mapper.productsView(p_id);
	}

	@Override
	public boolean productsModify(ProductsVO products) throws Exception {
//		log.info("modify....." + board);
//		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = true;
		modifyResult = mapper.productsModify(products) == 1;

//		int attachList = 0;
//		if (board.getAttachList() != null)
//			attachList = board.getAttachList().size();

//		if (modifyResult > 0) {
//			products.getAttachList().forEach(attach -> {
//				attach.setBno(board.getBno());
//				attachMapper.insert(attach);
//			});
//		}
		return modifyResult;
	}

	@Override
	public boolean productsRemove(int p_id) throws Exception {
//		attachMapper.deleteAll(bno);
//		replyMapper.deleteAll(bno);

//		boardMapper.updateReplyCnt(vo.getBno(), -1);
//		return mapper.delete(rno);

		return (mapper.productsRemove(p_id)) == 1;
	}

	@Override
	public List<UserVO> getList(Criteria cri) throws Exception {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) throws Exception {
		return mapper.getTotalCount(cri);
	}

	@Override
	public int getProductsTotal(Criteria cri) throws Exception {
		return mapper.getProductsTotalCount(cri);
	}

	@Override
	public List<ProductsVO> productsCategory01List(Criteria cri) throws Exception {
		return mapper.getProductsCategory01ListWithPaging(cri);
	}

	@Override
	public int getProductsCategory01Total(Criteria cri) throws Exception {
		return mapper.getProductsCategory01TotalCount(cri);
	}

	@Override
	public List<ProductsVO> productsCategory02List(Criteria cri) throws Exception {
		return mapper.getProductsCategory02ListWithPaging(cri);
	}

	@Override
	public int getProductsCategory02Total(Criteria cri) throws Exception {
		return mapper.getProductsCategory02TotalCount(cri);
	}

	/* 공지사항 등록 */
	@Override
	public void noticeRegister(NoticeVO vo) throws Exception {
		mapper.noticeRegister(vo);
	}

	/* 공지사항 목록 */
	@Override
	public List<NoticeVO> noticeList(Criteria cri) throws Exception {
		return mapper.noticeList(cri);
	}

	@Override
	public List<NoticeVO> noticePrevList(Criteria cri) throws Exception {
		return mapper.noticePrevList(cri);
	}

	/* 총 공지사항 글 갯수 */
	@Override
	public int getNoticeListTotalCount(Criteria cri) throws Exception {
		return mapper.getNoticeListTotalCount(cri);
	}

	/* 공지사항 조회 */
	@Override
	public NoticeVO noticeView(int n_no) throws Exception {
		return mapper.noticeView(n_no);
	}

	/* 공지사항 조회 수 증가 */
	@Override
	public void updateViewCnt(int n_no) throws Exception {
		mapper.updateViewCnt(n_no);
	}

	/* 공지사항 수정 */
	@Override
	public void noticeModify(NoticeVO vo) throws Exception {
		mapper.noticeModify(vo);
	}

	/* 공지사항 삭제 */
	@Override
	public void noticeRemove(int n_no) throws Exception {
		mapper.noticeRemove(n_no);
	}

	/* 퍼니's 목록 */
	@Override
	public List<FunnyVO> funnyList(Criteria cri) throws Exception {
		return mapper.funnyList(cri);
	}

	/* 총 퍼니's 글 갯수 */
	@Override
	public int getFunnyListTotalCount(Criteria cri) throws Exception {
		return mapper.getFunnyListTotalCount(cri);
	}

	/* 퍼니's 이전/다음글 페이징 처리 */
	@Override
	public List<FunnyVO> funnyPrevList(Criteria cri) throws Exception {
		return mapper.funnyPrevList(cri);
	}

	/* 퍼니's 조회 */
	@Override
	public FunnyVO funnyView(int f_no) throws Exception {
		return mapper.funnyView(f_no);
	}

	/* 퍼니's 수정 */
	@Override
	public boolean funnyModify(FunnyVO vo) throws Exception {

		boolean modifyResult = true;
		modifyResult = mapper.funnyModify(vo) == 1;
		return modifyResult;

	}

	/* 퍼니's 삭제 */
	@Override
	public boolean funnyRemove(int f_no) throws Exception {
		return (mapper.funnyRemove(f_no)) == 1;
	}

	/* 이어펀's 등록 */
	@Override
	public void earFunRegister(EarFunVO vo) throws Exception {
		mapper.earFunRegister(vo);
	}

	/* 이어펀's 목록 */
	@Override
	public List<EarFunVO> earFunList(Criteria cri) throws Exception {
		return mapper.earFunList(cri);
	}

	/* 총 이어펀's 글 갯수 */
	@Override
	public int getEarFunListTotalCount(Criteria cri) throws Exception {
		return mapper.getEarFunListTotalCount(cri);
	}

	/* 이어펀's 이전/다음글 페이징 처리 */
	@Override
	public List<EarFunVO> earFunPrevList(Criteria cri) throws Exception {
		return mapper.earFunPrevList(cri);
	}

	/* 이어펀's 조회 */
	@Override
	public EarFunVO earFunView(int e_no) throws Exception {
		return mapper.earFunView(e_no);
	}

	/* 이어펀's 수정 */
	@Override
	public boolean earFunModify(EarFunVO vo) throws Exception {

		boolean modifyResult = true;
		modifyResult = mapper.earFunModify(vo) == 1;
		return modifyResult;
	}

	/* 이어펀's 삭제 */
	@Override
	public boolean earFunRemove(int e_no) throws Exception {
		return (mapper.earFunRemove(e_no)) == 1;
	}

	/* 상황별 음악 등록 */
	@Override
	public void moodRegister(MoodVO vo) throws Exception {
		mapper.moodRegister(vo);
	}

	/* 상황별 음악 목록 */
	@Override
	public List<MoodVO> moodList(Criteria cri) throws Exception {
		return mapper.moodList(cri);
	}

	/* 총 상황별 음악 글 갯수 */
	@Override
	public int getMoodListTotalCount(Criteria cri) throws Exception {
		return mapper.getMoodListTotalCount(cri);
	}

	/* 상황별 음악 이전/다음글 페이징 처리 */
	@Override
	public List<MoodVO> moodPrevList(Criteria cri) throws Exception {
		return mapper.moodPrevList(cri);
	}

	/* 상황별 음악 조회 */
	@Override
	public MoodVO moodView(int m_no) throws Exception {
		return mapper.moodView(m_no);
	}

	/* 상황별 음악 수정 */
	@Override
	public boolean moodModify(MoodVO vo) throws Exception {

		boolean modifyResult = true;
		modifyResult = mapper.moodModify(vo) == 1;
		return modifyResult;
	}

	/* 상황별 음악 삭제 */
	@Override
	public boolean moodRemove(int m_no) throws Exception {

		return (mapper.moodRemove(m_no)) == 1;

	}

	@Override
	public List<OrderVO> orderList() throws Exception {
		return mapper.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return mapper.orderView(order);
	}

	@Override
	public void status(OrderVO order) throws Exception {
		mapper.status(order);
	}

	@Override
	public void decreaseStock(ProductsVO products) throws Exception {
		mapper.decreaseStock(products);
	}

	@Override
	public List<ReportVO> reportList(Criteria cri) throws Exception {
		return mapper.getReportListWithPaging(cri);

	}

	@Override
	public int getReportTotal(Criteria cri) throws Exception {
		return mapper.getReportTotalCount(cri);
	}

	@Override
	public void reportStatus(ReportVO vo) throws Exception {
		mapper.reportStatus(vo);
	}

	@Override
	public ReportVO reportView(int r_no) throws Exception {
		return mapper.reportView(r_no);
	}

	@Override
	public void reportRemove(int r_no) throws Exception {
		mapper.reportRemove(r_no);
	}

	@Override
	public List<ReportVO> getUserBlackList(Criteria cri) throws Exception {
		return mapper.getUserBlackListWithPaging(cri);
	}

	@Override
	public int getUserBlackListTotal(Criteria cri) throws Exception {
		return mapper.getUserBlackListTotalCount(cri);
	}

	@Override
	public List<QnAVO> qnaList(Criteria cri) throws Exception {
		return mapper.getQnAListWithPaging(cri);
	}

	@Override
	public int getQnAListTotalCount(Criteria cri) throws Exception {
		return mapper.getQnATotalCount(cri);
	}

	@Override
	public QnAVO qnaView(int q_no) throws Exception {
		return mapper.qnaView(q_no);
	}

	@Override
	public void qnaReplyRegister(QnAReplyVO vo) throws Exception {
		mapper.qnaReplyRegister(vo);
	}

	@Override
	public void qnaStatus(QnAVO qna) throws Exception {
		mapper.qnaStatus(qna);
	}

	@Override
	public List<QnAReplyVO> qnaReply(int q_no) throws Exception {
		return mapper.qnaReply(q_no);
	}
}
