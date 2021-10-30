package com.poka.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.BoardVO;
import com.poka.domain.Criteria;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/board/*") //브라우저에서 /board/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class BoardController {

	
	//boardAdd.jsp
	//게시글 등록 화면
	@GetMapping("/add")
	@PreAuthorize("isAuthenticated()")
	public String add() {
		
		return null;
	}
	
	//게시글 등록
	@PostMapping("/add")
	@PreAuthorize("isAuthenticated()")
	public String add(BoardVO board, RedirectAttributes rttr) {
		log.info(".....register().....");
		
		//첨부파일이 있는 경우 데이터베이스에 추가
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		//boardService.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	//게시글 삭제
	@PostMapping("/delete")
	@PreAuthorize("principal.username == #writer")	//작성자 확인
	public String delete(String writer,
						 @RequestParam("bno") Long bno,
						 @ModelAttribute("cri") Criteria cri,
						 RedirectAttributes rttr) {
		log.info(".....delete().....");
		//List<BoardAttachVO> attachList = boardService.getAttachList(bno);
		
//		if(boardService.remove(bno)) {	//삭제에 성공한 경우
//			deleteFiles(attachList);	//첨부파일 삭제
//			rttr.addFlashAttribute("result", "success");
//		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	//게시물 수정
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.writer")	//작성자 확인
	public String modify(BoardVO board, 
						 @ModelAttribute("cri") Criteria cri,
						 RedirectAttributes rttr) {
		log.info(".....modify()....." + cri);
		log.info(board);
		
	

		return "redirect:/board/list" + cri.getListLink();
	}
	
	//boardView.jsp
	//게시물 하나 조회, 게시물 수정 화면 이동
	@GetMapping({ "/get", "/modify" })
	public String get(@RequestParam("bno") Long bno, 
					@ModelAttribute("cri") Criteria cri,
					Model model) {
		log.info(".....get() or modify() .....");
		
		return null;
	}
	
	//boardList.jsp
	//자유게시판 목록 화면
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info(".....list().....");
		
		return null;
		
		
	}
}
