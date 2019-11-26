package kr.icia.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.icia.domain.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {

		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			res.sendRedirect("/user/login");

			return false;
		}

		if (user == null || user.getAuth() != 1) {
			res.sendRedirect("/");
			return false;
		}
		return true;
	}
}
