package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
//	r_no number not null,
//	r_writer varchar2(50) not null,
//	r_contents varchar2(500) not null,
//	r_reason varchar2(500) not null,

	private int r_no;
	private String r_writer;
	private String r_contents;
	private String r_reason;
	private Date regDate;
	private String status;
}
