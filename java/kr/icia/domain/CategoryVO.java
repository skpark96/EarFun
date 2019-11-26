package kr.icia.domain;

import lombok.Data;

@Data
public class CategoryVO {
//    sub_name varchar2(20) not null,
//    sub_category varchar2(30) not null,
//    sub_codeRef varchar2(30) null,
	private String sub_name;
	private String sub_category;
	private String sub_codeRef;
	private int level;
}
