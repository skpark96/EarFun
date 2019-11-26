package kr.icia.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.transaction.annotation.Transactional;

import kr.icia.domain.UserVO;

public class UserMapperImplements implements UserMapper {

	@Inject
	private SqlSession sql;

	private static String namespace = "kr.icia.mapper.UserMapper";

	@Transactional
	public int signUp(UserVO vo) throws Exception {
		return sql.insert("user.signUp", vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}

	@Override
	public String findId(String u_email) throws Exception {
		return sql.selectOne("user.findId", u_email);
	}

	@Override
	public int checkId(String u_id) throws Exception {
		return sql.selectOne("user.checkId", u_id);
	}

	@Override
	public int checkEmail(String u_email) throws Exception {
		return sql.selectOne("user.checkEmail", u_email);
	}

	// 이메일 인증
	@Transactional
	public int approvalUser(UserVO vo) throws Exception {
		return sql.update("user.approvalUser", vo);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void withDrawal(UserVO vo) throws Exception {
		sql.delete(namespace + ".withDrawal", vo);
	}

	@Transactional
	public int findPw(UserVO vo) throws Exception {
		return sql.update("user.findPw", vo);
	}

//	@Override
//	public boolean checkPw(String u_id, String u_pw) throws Exception {
//		boolean result = false;
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("u_id", u_id);
//		map.put("u_pw", u_pw);
//		int count = sql.selectOne("user.checkPw", map);
//		if (count == 1)
//			result = true;
//		return result;
//	}

}
