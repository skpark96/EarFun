package kr.icia.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FunnyReplyVO {

   private int f_no;
   private String u_id;
   private int r_no;
   private String r_contents;
   private Date r_date;
   private int rating;
   
} // end of class