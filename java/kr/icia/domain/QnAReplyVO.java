package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnAReplyVO {
	private int q_no;
	private String r_contents;
	private Date r_date;
}
