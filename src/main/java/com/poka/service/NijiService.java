package com.poka.service;

import java.util.List;

import com.poka.domain.Criteria;
import com.poka.domain.NijiTagVO;
import com.poka.domain.NijiVO;

public interface NijiService {	

	
	public int getTotal(Criteria cri);					//전체 게시물 수 반환
	public boolean modify(NijiVO niji);				//게시물 하나 수정
	public boolean delete(String nno);					//게시물 하나 삭제
	public NijiVO get(String nno);						//게시물 하나 조회
	public void add(NijiVO niji);				//게시물 등록 with select Key
	public List<NijiVO> getList(Criteria cri);			//전체 게시물 목록 반환 - 페이징
	public List<NijiTagVO> getTag(String nno); // 한 게시물 당 태그 목록
	
}
