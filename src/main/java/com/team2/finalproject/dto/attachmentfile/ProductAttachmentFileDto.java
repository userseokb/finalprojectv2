package com.team2.finalproject.dto.attachmentfile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
//첨부파일(상품)
public class ProductAttachmentFileDto {
	//파일 번호
	private Integer fileNo;
	//상품 코드
	private Integer productCode;
	//이미지 파일 경로
	private String imgFilePath;
	//파일 원래 이름
	private String fileOriginalName;
	//파일 이름(uuid)
	private String fileName;

	
	
}
