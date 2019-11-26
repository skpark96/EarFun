package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(Long r_no);

	public int delete(Long r_no);

	public int update(ReplyVO reply);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("p_no") Long p_no);
//	페이지 정보와 게시물 번호를 전달.

	public int getCountByBno(Long p_no);

	public int deleteAll(Long p_no);

	public void updateReplyCnt(@Param("p_no") Long p_no, @Param("amount") int amount);
}
