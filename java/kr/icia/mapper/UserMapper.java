package kr.icia.mapper;

import kr.icia.domain.UserVO;

public interface UserMapper {
	public int signUp(UserVO vo) throws Exception;

	public UserVO login(UserVO vo) throws Exception;

	public String findId(String u_email) throws Exception;

	public int checkId(String u_id) throws Exception;

	public int checkEmail(String u_email) throws Exception;

	public int approvalUser(UserVO vo) throws Exception;

	public void modify(UserVO vo) throws Exception;

	// 회원탈퇴
	public void withDrawal(UserVO vo) throws Exception;

	public int findPw(UserVO vo) throws Exception;

//	boolean checkPw(String u_id, String u_pw) throws Exception;
}
