package kh.fin.giboo.member.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.fin.giboo.event.controller.EventController;
import kh.fin.giboo.member.model.service.MyPageService;
import kh.fin.giboo.member.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
@RequestMapping("/mypage")
public class MypageController {
	private Logger logger = LoggerFactory.getLogger(EventController.class);

	@Autowired
	private MyPageService service;

	// 마이페이지 메인
	@GetMapping(value = "/mypageMain")
	public String mypageMain() {
		logger.info("마이페이지 메인");
		return "mypage/mypageMain";
	}

	// 회원정보 수정
	@GetMapping(value = "/memberChange")
	public String memberChange() {
		logger.info("회원정보수정");
		return "mypage/memberChange";
	}

	// 즐겨찾기
	@GetMapping(value = "/favorites")
	public String favorites() {
		logger.info("즐겨찾기");
		return "mypage/favorites";
	}

	// 나의 활동1(기부)
	@GetMapping(value = "/myactive_1")
	public String myactive_1() {
		logger.info("나의활동1");
		return "mypage/myactive_1";
	}

	// 나의 활동2(봉사)
	@GetMapping(value = "/myactive_2")
	public String myactive_2() {
		logger.info("나의활동2");
		return "mypage/myactive_2";
	}

	// 나의 활동3(참여한 이벤트)
	@GetMapping(value = "/myactive_3")
	public String myactive_3() {
		logger.info("나의활동3");
		return "mypage/myactive_3";
	}

	// 나의 문의
	@GetMapping(value = "/myask")
	public String myask() {
		logger.info("나의문의");
		return "mypage/myask";
	}

	// 나의 문의내역 글쓰기
	@GetMapping(value = "/myaskWrite")
	public String myaskWrite() {
		logger.info("나의문의 글쓰기");
		return "mypage/myaskWrite";
	}

	// 나의 문의내역 상세내용
	@GetMapping(value = "/myaskDetail")
	public String myaskDetail1() {
		logger.info("나의문의 상세");
		return "mypage/myaskDetail";
	}

	// 나의 리뷰
	@GetMapping(value = "/myreview")
	public String myreview() {
		logger.info("나의리뷰 목록");
		return "mypage/myreview";
	}

	// 회원탈퇴
	@GetMapping(value = "/withdrawal")
	public String withdrawal() {
		logger.info("나의리뷰 목록");
		return "mypage/withdrawal";
	}

	

	// 인증서 출력
	@GetMapping(value = "/reportPrint")
	public String reportPrint() {
		logger.info("인증서 출력");
		return "mypage/reportPrint";
	}

	// ===================================================

	@PostMapping("/info")
	public String updateInfo(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap,
			// 요청시 전달된 파라미터를 구분하지 않고 모두 Map 에 담아서 얻어옴
			String[] updateAddress, RedirectAttributes ra) {

		// 파라미터를 저장한 paraMap 에 회원번호, 주소를 추가함!
		String memberAddress = String.join(",,", updateAddress);

		// 주소가 미입력 되었을때
		if (memberAddress.equals(",,,,"))
			memberAddress = null;

		paramMap.put("memberNo", loginMember.getMemberNo());
//		paramMap.put("memberAddress", memberAddress);

		// 회원정보 수정 서비스 호출(update)
		int result = service.updateInfo(paramMap);

		String message = null;
		if (result > 0) {
			message = "회원정보가 수정되었습니다";
			// DA와 Session 의 정보를 일치시켜주기==동기화

			loginMember.setMemberName((String) paramMap.get("updateName"));
			loginMember.setMemberNick((String) paramMap.get("updateNickname"));
			loginMember.setMemberTel((int) paramMap.get("updateTel"));
			loginMember.setMemberAddr((String) paramMap.get("updateAddr"));
			loginMember.setMemberPw((String) paramMap.get("updatePw"));

		} else {
			message = "회원정보 수정 실패했습니다";
		}
		ra.addFlashAttribute("message", message); // messag를 session 으로 보내기 위해서, 사용!
		return "redirect:info";
	}

}
