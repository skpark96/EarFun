package kr.icia.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("select sysdate from dual")
	public String getTime();
	
	public String getTime2();
	
	/* - interface는 이종 간 기기의 연결을 위한 부분이다.
 	- 규격을 제한하고 있다.
 	- interface의 메소드 몸체는 없다. {} 
 	- interface를 가져다쓰는 부분에서 몸체를 구현한다.
 	- Spring Framework는 interface를 implement 받는 클래스를 생성하고,
 	  몸체를 구현하는 번거로운 작업을 대신 자동 처리한다. */
	
} // end of class