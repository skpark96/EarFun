package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

//    u_id varchar2(50) not null,
//    u_pw varchar2(100) not null,
//    u_name varchar2(30) not null,
//    u_phone varchar2(20) not null,
//    u_email varchar2(20) null,
//    u_addr1 varchar2(20) null,
//    u_addr2 varchar2(50) null,
//    u_addr3 varchar2(50) null,
//    regDate date default sysdate,
//    auth number default 0,
//    primary key(u_id)

	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private String u_email;
	private String u_addr1;
	private String u_addr2;
	private String u_addr3;
	private String approval_status;
	private String approval_key;
	private Date regDate;
	private int auth;
}