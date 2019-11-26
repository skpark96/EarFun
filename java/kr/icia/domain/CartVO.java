package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
//    c_no number not null,
//    u_id varchar2(100) not null,
//    p_no number not null,
//    c_stock number not null,
//    c_date date default sysdate,
//    primary key(c_no, u_id)

	private int c_no;
	private String u_id;
	private int p_no;
	private int c_stock;
	private Date c_date;
}
