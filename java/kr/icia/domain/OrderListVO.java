package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {

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

	private int o_no;
	private int p_no;
	private int c_stock;

	private String p_name;
	private String p_thumbImg;
	private String p_price;
}
