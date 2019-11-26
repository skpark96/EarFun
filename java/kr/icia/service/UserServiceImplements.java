package kr.icia.service;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.icia.domain.UserVO;
import kr.icia.mapper.UserMapper;

@Service
public class UserServiceImplements implements UserService {

	@Inject
	private UserMapper mapper;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Override
	public int signUp(HttpServletResponse response, UserVO vo) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		if (mapper.checkId(vo.getU_id()) == 1) {
			out.println("<script>");
			out.println("alert('이미 등록된 아이디입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (mapper.checkEmail(vo.getU_email()) == 1) {
			out.println("<script>");
			out.println("alert('이미 등록된 이메일입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
//			out.println("<script>");
//			out.println("alert('회원가입이 완료되었습니다.');");
//			out.println("</script>");
//			out.close();
			vo.setApproval_key(createKey());
			mapper.signUp(vo);
			sendMail(vo, "signUp");
			return 1;
		}
	}

	@Override
	public UserVO login(HttpServletResponse response, UserVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (mapper.login(vo) == null) {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else {
			return mapper.login(vo);
		}
		return null;
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}

	@Override
	public String findId(HttpServletResponse response, String u_email) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String u_id = mapper.findId(u_email);

		if (u_id == null) {
			out.println("<script>");
			out.println("alert('입력하신 정보와 일치하는 회원 데이터가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return u_id;
		}
	}

	@Override
	public void checkId(HttpServletResponse response, String u_id) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mapper.checkId(u_id));
		out.close();
	}

	@Override
	public void checkEmail(HttpServletResponse response, String u_email) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mapper.checkEmail(u_email));
		out.close();
	}

	@Override
	public String createKey() throws Exception {
		String key = "";
		Random random = new Random();

		for (int i = 0; i < 8; i++) {
			key += random.nextInt(10);
		}
		return key;
	}

//	@EnableWebSecurity
//	public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	// 이메일 발송
	@Override
	public void sendMail(UserVO vo, String div) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "ear_fun";
		String hostSMTPpwd = "!earfun1234";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "ear_fun@naver.com";
		String fromName = "EAR FUN";
		String subject = "";
		String msg = "";

		if (div.equals("signUp")) {
			// 회원가입 메일 내용
			subject = "EAR FUN 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getU_id() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='get' action='http://localhost:8090/user/approvalUser'>";
			msg += "<input type='hidden' name='u_email' value='" + vo.getU_email() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + vo.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		} else if (div.equals("findPw")) {
			subject = "EAR FUN 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getU_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getU_pw() + "</p></div>";

		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getU_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
//	}

	// 회원 인증
	@Override
	public int approvalUser(UserVO vo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (mapper.approvalUser(vo) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='../main';");
			out.println("</script>");
			out.close();
		}
		return 0;
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		mapper.modify(vo);
	}

	@Override
	public void withDrawal(UserVO vo) throws Exception {
		mapper.withDrawal(vo);
	}

	@Override
	public void findPw(HttpServletResponse response, UserVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if (mapper.checkId(vo.getU_id()) == 0) {
			out.println(
					"<script>alert('입력하신 정보를 다시 확인해주세요.'); location.href='http://localhost:8090/user/findPw';</script>");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		/*
		 * else if (!vo.getU_email().equals(mapper.login(vo.getU_id()).getU_email())) {
		 * out.print("잘못된 이메일 입니다."); out.close(); }
		 */else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			vo.setU_pw(pw);
			// 비밀번호 변경
			mapper.findPw(vo);
			// 비밀번호 변경 메일 발송
			sendMail(vo, "findPw");

			out.println(
					"<script>alert('입력하신 이메일로 임시 비밀번호가 발송되었습니다.'); location.href='http://localhost:8090/user/findPw';</script>");
			out.close();
		}

	}

//	@Override
//	public boolean checkPw(String u_id, String u_pw) throws Exception {
//		return mapper.checkPw(u_id, u_pw);
//	}
}