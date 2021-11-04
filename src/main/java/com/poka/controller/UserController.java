package com.poka.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poka.domain.UserVO;
import com.poka.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //스프링이 빈으로 관리하도록 어노테이션 추가
@Log4j
@RequestMapping("/user/*") //브라우저에서 /user/~~ 로 들어오는 모든 요청을 처리하도록 어노테이션 추가
@AllArgsConstructor
public class UserController {

	private UserService userService;
	
	//로그인
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		log.info("Login()");
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 에러 - 계정을 확인해주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
	public void logout() {
		log.info("logout()");
	}
	
	//로그인을 하지 않은 사용자도 접근 가능한 URL
	@GetMapping("/all")
	public void all() {
		log.info("/all 접근 제한 x");
	}

	//로그인 한 사용자들만 접근할 수 있는 URL
	@GetMapping("/member")
	public void member() {
		log.info("/member 접근 제한 O - 로그인한 사용자");
	}

	//로그인 한 사용자들 중에서 관리자 권한을 가진 사용자만이 접근할 수 있는 URL
	@GetMapping("/admin")
	public void admin() {
		log.info("/admin 접근 제한 O - 로그인한 관리자");
	}
	
	//접근거부
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("accessDenied()");
		model.addAttribute("msg", "접근 거부 - 권한 부족");
		return null;
	}
	
	//회원 가입 화면
	@GetMapping("/signIn")
	public void signIn() {}
	
	//회원 가입
	@PostMapping("/signIn")
	public String signIn(UserVO vo) {
		log.info("signIn()");
System.out.println("user -->"+vo.getEmail());
		userService.signIn(vo);
		return "redirect:/";
	}

	//회원탈퇴
	@PostMapping("/delete")
	public String delete(@RequestParam("userid") String userid, RedirectAttributes rttr) {
		log.info(".....delete().....");
	
		return "redirect:/";
	}
	
	//userView.jsp
	//회원 정보 조회 화면
	@GetMapping("/get")
	public String get(UserVO vo) {
		log.info("get()");
		return null;
	}
	
	//아이디 체크
	@GetMapping("/chk/id")
	public String chkId(@RequestBody UserVO vo) throws Exception{
		
		int result = userService.idchk(vo);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	//닉네임 체크
	@GetMapping("/chk/nick")
	public ResponseEntity<String> chkNick(@RequestBody UserVO vo) {
		
		return null;
	}
	
	//이메일 체크
	@PostMapping("/chk/email")
	public ResponseEntity<String> chkEmail(@RequestBody UserVO vo ) {
		
		return null;
	}
	
	//userUpdate.jsp
	//회원정보 수정 화면
	@GetMapping("/modify")
	public String modify() {
		return null;
	}
	
	//회원정보 수정
	@PostMapping("/modify")
	public String modify(UserVO vo) {
		
		return null;
	}
	
	//비밀번호 변경
	@PostMapping("/chg/pw")
	public ResponseEntity<String> chgPw(@RequestBody UserVO vo) {
		
		return null;
	}
	
	//닉네임 변경
	@PostMapping("/chg/nick")
	public ResponseEntity<String> chgNink(@RequestBody UserVO vo) {
		
		return null;
	}
	
}
