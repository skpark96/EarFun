package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductsVO {

//	 p_id number,
//	 p_name varchar2(50) not null,
//	 p_category varchar2(50) not null,
//	 p_brand varchar2(50) not null,
//	 p_price number default 0 not null,
//	 p_point number default 0,
//	 p_stock number not null,
//	 p_contents varchar2(500),
//	 p_date date default sysdate,
//	 p_image varchar2(500),

	private int p_no;
	private String p_name;
	private String p_category;
	private String p_brand;
	private String p_price;
	private int p_point;
	private int p_stock;
	private String p_contents;
	private Date p_date;
	private Date p_updateDate;
	private String p_image;
	private String p_thumbImg;
	private String p_sub_category;

}
