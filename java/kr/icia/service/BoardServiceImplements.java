package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
import kr.icia.mapper.BoardMapper;

@Service
public class BoardServiceImplements implements BoardService {

	@Inject
	private BoardMapper mapper;

	/* 퍼니's 등록 */
	@Override
	public void funnyRegister(FunnyVO vo) throws Exception {
		mapper.funnyRegister(vo);
	}

	/* 퍼니's 목록 */
	@Override
	public List<FunnyVO> funnyList(Criteria cri) throws Exception {
		return mapper.funnyList(cri);
	}

	@Override
	public List<FunnyLikeVO> funnyLikeCount(int f_no) throws Exception {
		return mapper.funnyLikeCount(f_no);
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
		mapper.updateFunnyViewCnt(f_no);
		return mapper.funnyView(f_no);
	}

	@Override
	public FunnyLikeVO funnyLikeView(FunnyLikeVO like) throws Exception {
		return mapper.funnyLikeView(like);
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

	@Override
	public void funnyLikeRemove(FunnyLikeVO like) throws Exception {
		mapper.funnyLikeRemove(like);
	}

	/* 퍼니's 후기 작성 */
	@Override
	public void funnyReplyRegister(FunnyReplyVO reply) throws Exception {
		mapper.funnyReplyRegister(reply);
	}

	/* 퍼니's 후기 목록 */
	@Override
	public List<FunnyReplyListVO> funnyReplyList(int f_no) throws Exception {
		return mapper.funnyReplyList(f_no);
	}

	@Override
	public List<FunnyReplyListVO> funnyReportInfo(int r_no) throws Exception {
		return mapper.funnyReportInfo(r_no);
	}

	/* 퍼니's 후기 삭제 */
	@Override
	public void funnyDeleteReply(FunnyReplyVO reply) throws Exception {
		mapper.funnyDeleteReply(reply);
	}

	/* 퍼니's 후기 삭제 시 아이디 체크 */
	@Override
	public String FunnyIdCheck(int r_no) throws Exception {
		return mapper.funnyIdCheck(r_no);
	}

	@Override
	public int getFunnyReplyTotal(Criteria cri) throws Exception {
		return mapper.getFunnyReplyTotalCount(cri);
	}

	/* 퍼니's 신고 */
	@Override
	public void report(ReportVO vo) throws Exception {

		mapper.report(vo);
	}

	@Override
	public void funnyLikeRegister(FunnyLikeVO like) throws Exception {
		mapper.funnyLikeRegister(like);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

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
		mapper.updateEarFunViewCnt(e_no);
		return mapper.earFunView(e_no);
	}

	/* 이어펀's 댓글 작성 */
	@Override
	public void earFunReplyRegister(EarFunReplyVO reply) throws Exception {
		mapper.earFunReplyRegister(reply);
	}

	/* 이어펀's 댓글 목록 */
	@Override
	public List<EarFunReplyListVO> earFunReplyList(int e_no) throws Exception {
		return mapper.earFunReplyList(e_no);
	}

	/* 이어펀's 댓글 삭제 */
	@Override
	public void earFunDeleteReply(EarFunReplyVO reply) throws Exception {
		mapper.earFunDeleteReply(reply);
	}

	/* 이어펀's 댓글 삭제 시 아이디 체크 */
	@Override
	public String earFunIdCheck(int r_no) throws Exception {
		return mapper.earFunIdCheck(r_no);
	}

	/* 이어펀's 댓글 총 개수 */
	@Override
	public int getEarFunReplyTotal(Criteria cri) throws Exception {
		return mapper.getEarFunReplyTotalCount(cri);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

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
		mapper.updateMoodViewCnt(m_no);
		return mapper.moodView(m_no);
	}

	/* 상황별 음악 작성 */
	@Override
	public void moodReplyRegister(MoodReplyVO reply) throws Exception {
		mapper.moodReplyRegister(reply);
	}

	/* 상황별 음악 후기 목록 */
	@Override
	public List<MoodReplyListVO> moodReplyList(int m_no) throws Exception {
		return mapper.moodReplyList(m_no);
	}

	/* 상황별 음악 후기 삭제 */
	@Override
	public void moodDeleteReply(MoodReplyVO reply) throws Exception {
		mapper.moodDeleteReply(reply);
	}

	/* 상황별 음악 후기 삭제 시 아이디 체크 */
	@Override
	public String MoodIdCheck(int r_no) throws Exception {
		return mapper.moodIdCheck(r_no);
	}

	/* 상황별 음악 후기 총 개수 */
	@Override
	public int getMoodReplyTotal(Criteria cri) throws Exception {
		return mapper.getMoodReplyTotalCount(cri);
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////

	/* 공지사항 목록 */
	@Override
	public List<NoticeVO> userNoticeList(Criteria cri) throws Exception {
		return mapper.userNoticeList(cri);
	}

	/* 총 공지사항 글 갯수 */
	@Override
	public int getUserNoticeListTotalCount(Criteria cri) throws Exception {
		return mapper.getUserNoticeListTotalCount(cri);
	}

	/* 공지사항 조회 */
	@Override
	public NoticeVO userNoticeView(int n_no) throws Exception {
		return mapper.userNoticeView(n_no);
	}

	@Override
	public void qnaRegister(QnAVO vo) throws Exception {
		mapper.qnaRegister(vo);

	}

	@Override
	public List<QnAVO> qnaList(String u_id) throws Exception {
		return mapper.qnaList(u_id);
	}

	@Override
	public int getQnAListTotal(Criteria cri) throws Exception {
		return mapper.getQnATotalCount(cri);
	}

	@Override
	public QnAVO qnaView(int q_no) throws Exception {
		return mapper.qnaView(q_no);
	}

	@Override
	public List<QnAReplyVO> qnaReplyView(int q_no) throws Exception {
		return mapper.qnaReplyView(q_no);
	}

	@Override
	public List<FunnyVO> myMusic(String u_id) throws Exception {
		return mapper.myMusic(u_id);

	}

	@Override
	public int getMyMusicListTotal(Criteria cri) throws Exception {
		return mapper.getMyMusicListTotalCount(cri);
	}

} // end of class