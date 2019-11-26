package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
//    o_id varchar2(50) not null, -- 주문번호
//    u_id varchar2(50) not null,
//    o_rec varchar2(50) not null, -- 수령인
//    u_addr1 varchar2(20) not null,
//    u_addr2 varchar2(50) not null,
//    u_addr3 varchar2(50) not null,
//    o_phone varchar2(30) not null, -- 연락처
//    total_price varchar2(50) not null, -- 총 상품금액
//    o_date Date default sysdate, -- 주문일

	private String o_id;
	private String u_id;
	private String o_rec;
	private String u_addr1;
	private String u_addr2;
	private String u_addr3;
	private String o_phone;
	private String total_price;
	private Date o_date;
	private String status;
}
