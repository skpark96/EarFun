package kr.icia.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

// Setter, Getter, equals, toString 등이 자동으로 생성된다.
@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int replyCnt;
	private List<BoardAttachVO> attachList;

} // end of class







