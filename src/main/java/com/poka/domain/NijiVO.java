package com.poka.domain;

import java.util.Date;
import java.util.List;

import com.poka.domain.BoardAttachVO;

public class NijiVO {

	private BoardAttachVO boardAttachVO;
	private String   nno; //거래글 넘버
	private String title; 
	private String content;
	private String writer;
	private String category;
	private int price;
	private List<TagVO> tagVO;
	private Date   regDate;
	private Date   updateDate;
	
	
	
}
