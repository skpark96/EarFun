package kr.icia.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.icia.domain.UserVO;

public interface UserService {
	public int signUp(HttpServletResponse response, UserVO vo) throws Exception;

	public UserVO login(HttpServletResponse response, UserVO vo) throws Exception;

	public void logout(HttpSession session) throws Exception;

	public String findId(HttpServletResponse response, String u_email) throws Exception;

	public void checkId(HttpServletResponse response, String u_id) throws Exception;

	public void checkEmail(HttpServletResponse response, String u_email) throws Exception;

	public String createKey() throws Exception;

	public void sendMail(UserVO vo, String div) throws Exception;

	public void modify(UserVO vo) throws Exception;

	public void withDrawal(UserVO vo) throws Exception;

	int approvalUser(UserVO vo, HttpServletResponse response) throws Exception;
	
	public void findPw(HttpServletResponse response, UserVO vo) throws Exception;

//	public boolean checkPw(String u_id, String u_pw) throws Exception;
}
