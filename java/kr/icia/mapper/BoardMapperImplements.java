package kr.icia.mapper;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.icia.domain.Criteria;
import kr.icia.domain.EarFunReplyListVO;
import kr.icia.domain.EarFunReplyVO;
import kr.icia.domain.EarFunVO;
import kr.icia.domain.FunnyLikeVO;
import kr.icia.domain.FunnyReplyListVO;
import kr.icia.domain.FunnyReplyVO;
import kr.icia.domain.FunnyVO;
import kr.icia.domain.MoodReplyListVO;
import kr.icia.domain.MoodReplyVO;
import kr.icia.domain.MoodVO;
import kr.icia.domain.NoticeVO;
import kr.icia.domain.QnAReplyVO;
import kr.icia.domain.QnAVO;
import kr.icia.domain.ReportVO;

public class BoardMapperImplements implements BoardMapper {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.icia.mapper.BoardMapper";

	/* 퍼니's 등록 */
	@Override
	public void funnyRegister(FunnyVO vo) throws Exception {
		sql.insert(namespace + ".funnyRegister", vo);
	}

	/* 퍼니's 목록 */
	@Override
	public List<FunnyVO> funnyList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".funnyList");
	}

	@Override
	public List<FunnyLikeVO> funnyLikeCount(int f_no) throws Exception {
		return sql.selectList(namespace + ".funnyLikeCount", f_no);
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

	@Override
	public void funnyLikeRegister(FunnyLikeVO like) throws Exception {
		sql.insert(namespace + ".funnyLikeRegister", like);
	}

	@Override
	public void funnyLikeRemove(FunnyLikeVO like) throws Exception {
		sql.delete(namespace + ".funnyLikeRemove", like);
	}

	@Override
	public FunnyLikeVO funnyLikeView(FunnyLikeVO like) throws Exception {
		return sql.selectOne(namespace + ".funnyLikeView", like);
	}

	/* 퍼니's 조회 수 */
	@Override
	public void updateFunnyViewCnt(int f_no) throws Exception {
		sql.update(namespace + ".updateFunnyViewCnt", f_no);
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

	/* 퍼니's 댓글 작성 */
	@Override
	public void funnyReplyRegister(FunnyReplyVO reply) throws Exception {
		sql.insert(namespace + ".funnyReplyRegister", reply);
	}

	/* 퍼니's 댓글 목록 */
	@Override
	public List<FunnyReplyListVO> funnyReplyList(int f_no) throws Exception {
		return sql.selectList(namespace + ".funnyReplyList", f_no);
	}

	@Override
	public List<FunnyReplyListVO> funnyReportInfo(int r_no) throws Exception {
		return sql.selectList(namespace + ".funnyReportInfo", r_no);
	}

	/* 퍼니's 댓글 삭제 */
	@Override
	public void funnyDeleteReply(FunnyReplyVO reply) throws Exception {
		sql.delete(namespace + ".funnyDeleteReply", reply);
	}

	/* 퍼니's 댓글 삭제 시 아이디 체크 */
	@Override
	public String funnyIdCheck(int r_no) throws Exception {
		return sql.selectOne(namespace + ".funnyReplyUserIdCheck", r_no);
	}

	/* 퍼니's 댓글 총 개수 */
	@Override
	public int getFunnyReplyTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getFunnyReplyTotalCount", cri);
	}

	/* 퍼니's 신고 */
	@Override
	public void report(ReportVO vo) throws Exception {
		sql.insert(namespace + ".report", vo);
	}

	@Override
	public List<FunnyVO> myMusic(String u_id) throws Exception {
		return sql.selectList(namespace + ".myMusic", u_id);
	}

	@Override
	public int getMyMusicListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getMyMusicListTotalCount", cri);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

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

	/* 이어펀's 목록 페이징 처리 */
	@Override
	public List<EarFunVO> getEarFunListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getEarFunListWithPaging");
	}

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

	/* 이어펀's 조회 수 */
	@Override
	public void updateEarFunViewCnt(int e_no) throws Exception {
		sql.update(namespace + ".updateEarFunViewCnt", e_no);
	}

	/* 이어펀's 후기 작성 */
	@Override
	public void earFunReplyRegister(EarFunReplyVO reply) throws Exception {
		sql.insert(namespace + ".earFunReplyRegister", reply);
	}

	/* 이어펀's 후기 목록 */
	@Override
	public List<EarFunReplyListVO> earFunReplyList(int e_no) throws Exception {
		return sql.selectList(namespace + ".earFunReplyList", e_no);
	}

	/* 이어펀's 후기 삭제 */
	@Override
	public void earFunDeleteReply(EarFunReplyVO reply) throws Exception {
		sql.delete(namespace + ".earFunDeleteReply", reply);
	}

	/* 이어펀's 후기 삭제 시 아이디 체크 */
	@Override
	public String earFunIdCheck(int r_no) throws Exception {
		return sql.selectOne(namespace + ".earFunReplyUserIdCheck", r_no);
	}

	/* 이어펀's 후기 총 개수 */
	@Override
	public int getEarFunReplyTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getEarFunReplyTotalCount", cri);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

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

	/* 상황별 음악 조회 수 */
	@Override
	public void updateMoodViewCnt(int m_no) throws Exception {
		sql.update(namespace + ".updateMoodViewCnt", m_no);
	}

	/* 상황별 음악 후기 작성 */
	@Override
	public void moodReplyRegister(MoodReplyVO reply) throws Exception {
		sql.insert(namespace + ".moodReplyRegister", reply);
	}

	/* 상황별 음악 후기 목록 */
	@Override
	public List<MoodReplyListVO> moodReplyList(int m_no) throws Exception {
		return sql.selectList(namespace + ".moodReplyList", m_no);
	}

	/* 상황별 음악 후기 삭제 */
	@Override
	public void moodDeleteReply(MoodReplyVO reply) throws Exception {
		sql.delete(namespace + ".moodDeleteReply", reply);
	}

	/* 상황별 음악 후기 삭제 시 아이디 체크 */
	@Override
	public String moodIdCheck(int r_no) throws Exception {
		return sql.selectOne(namespace + ".moodReplyUserIdCheck", r_no);
	}

	/* 상황별 음악 후기 총 개수 */
	@Override
	public int getMoodReplyTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getMoodReplyTotalCount", cri);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 공지사항 목록 */
	@Override
	public List<NoticeVO> userNoticeList(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".noticeList");
	}

	/* 총 공지사항 글 갯수 */
	@Override
	public int getUserNoticeListTotalCount(Criteria cri) throws Exception {
		return sql.selectOne(namespace + ".getUserNoticeListTotalCount", cri);
	}

	/* 공지사항 목록 페이징 처리 */
	@Override
	public List<NoticeVO> getUserNoticeListWithPaging(Criteria cri) throws Exception {
		return sql.selectList(namespace + ".getUserNoticeListWithPaging");
	}

	/* 공지사항 조회 */
	@Override
	public NoticeVO userNoticeView(int n_no) throws Exception {
		return sql.selectOne(namespace + ".userNoticeView", n_no);
	}

	@Override
	public void qnaRegister(QnAVO vo) throws Exception {
		sql.insert(namespace + ".qnaRegister", vo);
	}

	@Override
	public List<QnAVO> qnaList(String u_id) throws Exception {
		return sql.selectList(namespace + ".qnaList", u_id);
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
	public List<QnAReplyVO> qnaReplyView(int q_no) throws Exception {
		return sql.selectList(namespace + ".qnaReplyView", q_no);
	}

} // end of class