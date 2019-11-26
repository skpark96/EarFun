package kr.icia.service;

import java.util.List;

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

public interface BoardService {

	/* 퍼니's 등록 */
	public void funnyRegister(FunnyVO vo) throws Exception;

	/* 퍼니's 목록 */
	public List<FunnyVO> funnyList(Criteria cri) throws Exception;

	/* 총 퍼니's 글 갯수 */
	public int getFunnyListTotalCount(Criteria cri) throws Exception;

	/* 퍼니's 이전/다음글 페이징 처리 */
	public List<FunnyVO> funnyPrevList(Criteria cri) throws Exception;

	/* 퍼니's 조회 */
	public FunnyVO funnyView(int f_no) throws Exception;

	public FunnyLikeVO funnyLikeView(FunnyLikeVO like) throws Exception;

	public List<FunnyLikeVO> funnyLikeCount(int f_no) throws Exception;

	/* 퍼니's 수정 */
	public boolean funnyModify(FunnyVO vo) throws Exception;

	/* 퍼니's 삭제 */
	public boolean funnyRemove(int f_no) throws Exception;

	public void funnyLikeRemove(FunnyLikeVO like) throws Exception;

	/* 퍼니's 후기 작성 */
	public void funnyReplyRegister(FunnyReplyVO reply) throws Exception;

	/* 퍼니's 후기 목록 */
	public List<FunnyReplyListVO> funnyReplyList(int f_no) throws Exception;

	public List<FunnyReplyListVO> funnyReportInfo(int r_no) throws Exception;

	/* 퍼니's 후기 삭제 */
	public void funnyDeleteReply(FunnyReplyVO reply) throws Exception;

	/* 퍼니's 후기 삭제 시 아이디 체크 */
	public String FunnyIdCheck(int r_no) throws Exception;

	/* 퍼니's 후기 총 개수 */
	public int getFunnyReplyTotal(Criteria cri) throws Exception;

	/* 퍼니's 신고 */
	public void report(ReportVO vo) throws Exception;

	public void funnyLikeRegister(FunnyLikeVO like) throws Exception;

	public List<FunnyVO> myMusic(String u_id) throws Exception;

	public int getMyMusicListTotal(Criteria cri) throws Exception;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 이어펀's 목록 */
	public List<EarFunVO> earFunList(Criteria cri) throws Exception;

	/* 총 이어펀's 글 갯수 */
	public int getEarFunListTotalCount(Criteria cri) throws Exception;

	/* 이어펀's 이전/다음글 페이징 처리 */
	public List<EarFunVO> earFunPrevList(Criteria cri) throws Exception;

	/* 이어펀's 조회 */
	public EarFunVO earFunView(int e_no) throws Exception;

	/* 이어펀's 후기 작성 */
	public void earFunReplyRegister(EarFunReplyVO reply) throws Exception;

	/* 이어펀's 후기 목록 */
	public List<EarFunReplyListVO> earFunReplyList(int e_no) throws Exception;

	/* 이어펀's 후기 삭제 */
	public void earFunDeleteReply(EarFunReplyVO reply) throws Exception;

	/* 이어펀's 후기 삭제 시 아이디 체크 */
	public String earFunIdCheck(int r_no) throws Exception;

	/* 이어펀's 후기 총 개수 */
	public int getEarFunReplyTotal(Criteria cri) throws Exception;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 상황별 음악 목록 */
	public List<MoodVO> moodList(Criteria cri) throws Exception;

	/* 총 상황별 음악 글 갯수 */
	public int getMoodListTotalCount(Criteria cri) throws Exception;

	/* 상황별 음악 이전/다음글 페이징 처리 */
	public List<MoodVO> moodPrevList(Criteria cri) throws Exception;

	/* 상황별 음악 조회 */
	public MoodVO moodView(int m_no) throws Exception;

	/* 상황별 음악 후기 작성 */
	public void moodReplyRegister(MoodReplyVO reply) throws Exception;

	/* 상황별 음악 후기 목록 */
	public List<MoodReplyListVO> moodReplyList(int m_no) throws Exception;

	/* 상황별 음악 후기 삭제 */
	public void moodDeleteReply(MoodReplyVO reply) throws Exception;

	/* 상황별 음악 후기 삭제 시 아이디 체크 */
	public String MoodIdCheck(int r_no) throws Exception;

	/* 상황별 음악 후기 총 개수 */
	public int getMoodReplyTotal(Criteria cri) throws Exception;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 공지사항 목록 */
	public List<NoticeVO> userNoticeList(Criteria cri) throws Exception;

	/* 총 공지사항 글 갯수 */
	public int getUserNoticeListTotalCount(Criteria cri) throws Exception;

	/* 공지사항 조회 */
	public NoticeVO userNoticeView(int n_no) throws Exception;

	public void qnaRegister(QnAVO vo) throws Exception;

	List<QnAVO> qnaList(String u_id) throws Exception;

	public int getQnAListTotal(Criteria cri) throws Exception;

	public QnAVO qnaView(int q_no) throws Exception;

	public List<QnAReplyVO> qnaReplyView(int q_no) throws Exception;

} // end of class