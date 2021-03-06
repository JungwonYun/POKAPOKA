package com.poka.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poka.domain.Criteria;
import com.poka.domain.SoudanVO;
import com.poka.mapper.SoudanMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SoudanServiceImpl implements SoudanService {
	// 상담 매퍼 생성
	private SoudanMapper sMapper;

	@Override
	public List<SoudanVO> getList(Criteria cri) {
		return sMapper.getListWithPaging();
	}

	@Override
	public SoudanVO get(String qno) {
		return sMapper.read(qno);
	}

	@Override
	public int register(SoudanVO qna) {
		return sMapper.insert(qna);

	}

	@Override
	public int modify(SoudanVO qna) {
		return sMapper.update(qna);

	}

}
