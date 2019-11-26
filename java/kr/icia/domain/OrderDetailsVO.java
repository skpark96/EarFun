package kr.icia.domain;

import lombok.Data;

@Data
public class OrderDetailsVO {
//    o_no number not null,
//    o_id varchar2(50) not null,
//    p_no number not null,
//    c_stock number not null,
	private int o_no;
	private String o_id;
	private int p_no;
	private int c_stock;
}
