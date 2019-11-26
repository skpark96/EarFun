package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnAVO {
	private int q_no;
	private String q_category;
	private String q_writer;
	private String q_title;
	private String q_contents;
	private Date q_date;
	private String status;
}
