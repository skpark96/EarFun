package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EarFunReplyVO {

	private int e_no;
	private String u_id;
	private int r_no;
	private String r_contents;
	private Date r_date;
	private int rating;
	private int r_cnt;

} // end of class