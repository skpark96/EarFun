package kr.icia.domain;

import lombok.Data;

@Data
public class AttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long p_no;

}
