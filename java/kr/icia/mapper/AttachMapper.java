package kr.icia.mapper;

import java.util.List;

import kr.icia.domain.AttachVO;

public interface AttachMapper {

	public void insert(AttachVO vo);

	public void delete(String uuid);

	public List<AttachVO> findByP_no(Long p_no);

	public void deleteAll(Long p_no);

	public List<AttachVO> getOldFiles();
}
