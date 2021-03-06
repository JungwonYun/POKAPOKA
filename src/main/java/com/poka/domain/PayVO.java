package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class PayVO {

	private String   pno; //결제 넘버
	private String   nno; //거래글 넘버
	private String title; 
	private String content;
	private String img; //판매이미지 
	private String seller; //판매자
	private String buyer; //구매자
	private String buyer_email; //구매자 이메일
	private int pay_status;
	private int price;
	private Date   payDate;
	private Date   updateDate;
	
}
