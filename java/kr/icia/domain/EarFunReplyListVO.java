package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EarFunReplyListVO {
   
   private int e_no;
   private String u_id;
   private int r_no;
   private String r_contents;
   private Date r_date;
   private String u_name;
   
} // end of class