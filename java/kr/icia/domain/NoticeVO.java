package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private int n_no;
	private String n_title;
	private String n_contents;
	private Date regDate;
	private int viewCnt;

} // end of class