package kh.fin.giboo.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.fin.giboo.member.model.service.MyPageService;
import kh.fin.giboo.member.model.vo.Member;

@Controller
@SessionAttributes({ "loginMember" })
@RequestMapping("/mypage")
public class MypageController {
	private Logger logger = LoggerFactory.getLogger(MypageController.class);

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

	// 비밀번호 변경
	@GetMapping(value = "/changePw")
	public String changePw() {
		logger.info("비밀번호 변경");
		return "mypage/changePw";
	}

	// 프로필 이미지 변경
	@GetMapping(value = "/changeProfile")
	public String changeProfile() {
		logger.info("비밀번호 변경");
		return "mypage/changeProfile";
	}

	// 즐겨찾기
	@GetMapping(value = "/favorites")
	public String favorites() {
		logger.info("즐겨찾기");
		return "mypage/favorites";
	}
	
	
	// 회원탈퇴
		@GetMapping(value = "/withdrawal")
		public String withdrawal() {
			logger.info("회원탈퇴 목록");
			return "mypage/withdrawal";
		}

	// 회원정보 수정(비번변경+프로필 이미지변경)==================================================
	@PostMapping("/memberChange")
	public String memberChange(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, Object> paramMap, // 요청 시 전달된 파라미터를 구분하지 않고 모두 Map에 담아서 얻어옴.
			String[] updateAddress, RedirectAttributes ra) {

		String memberAddress = String.join(",,", updateAddress); // 주소 배열 -> 문자열로 변환

		// [,,] -> ",,,,"
		// 주소가 미입력 되었을 때
		if (memberAddress.equals(",,,,"))
			memberAddress = null;

		paramMap.put("memberNo", loginMember.getMemberNo());
		paramMap.put("memberAddress", memberAddress);

		// 회원 정보 수정 서비스 호출
		int result = service.memberChange(paramMap);

		String message = null;
		String path = null;

		if (result > 0) {

			// DB - Session의 회원정보 동기화(얕은 복사 활용)
			loginMember.setMemberName((String) paramMap.get("updateName"));
			loginMember.setMemberNick((String) paramMap.get("updateNickname"));
			loginMember.setMemberTel((String) paramMap.get("updateTel"));
			loginMember.setMemberAddr((String) paramMap.get("memberAddress"));

			message = "회원 정보 수정 성공";
			path = "redirect:/mypage/mypageMain"; // 마이페이지 메인
		} else {
			message = "회원 정보 수정 실패";
			path = "redirect:/mypage/memberChange"; // 회원정보수정 페이지
		}
		ra.addFlashAttribute("message", message);
		logger.info("-----------------회원정보수정---------------");

		return "redirect:/mypage/memberChange";
		// return path;

	}

	// 회원 비밀번호 변경=================
	@PostMapping("/changePw")
	public String changePw(@RequestParam Map<String, Object> paramMap,
			@ModelAttribute("loginMember") Member loginMember, RedirectAttributes ra) {

		// 로그인된 회원의 번호를 paramMap에 추가
		paramMap.put("memberNo", loginMember.getMemberNo());

		// 비밀번호 변경 서비스 호출
		int result = service.changePw(paramMap);

		String message = null;
		String path = null;

		if (result > 0) {
			loginMember.setMemberPw((String) paramMap.get("newPw"));

			message = "비밀번호가 변경되었습니다.";
			path = "info";
		} else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			path = "changePw";
		}

		ra.addFlashAttribute("message", message);
		logger.info("-----------------비밀번호 변경---------------");

		return "redirect:/mypage/changePw";
	}

	// 회원 프로필 이미지 변경==================================================
	@PostMapping("/changeProfile")
	public String changeProfile(@ModelAttribute("loginMember") Member loginMember,
			@RequestParam("uploadImg") MultipartFile uploadImg /* 업로드 파일 */
			, @RequestParam Map<String, Object> map /* delete 담겨있음 */
			, HttpServletRequest req /* 파일 저장 경로 탐색용 */
			, RedirectAttributes ra) throws IOException {

		
		String webPath = "/resources/images/memberProfile/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);

		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("uploadImg", uploadImg);
		map.put("memberNo", loginMember.getMemberNo());

		int result = service.changeProfile(map);

		String message = null;

		if (result > 0) {
			message = "프로필 이미지가 변경되었습니다.";
			loginMember.setProfileImg((String) map.get("profileImg"));

		} else {
			message = "프로필 이미지 변경 실패...";
		}

		ra.addFlashAttribute("message", message);
		logger.info("-----------------프로필 이미지 변경---------------");

		return "redirect:/mypage/changeProfile";
	}

	// 회원 탈퇴
		@PostMapping("/withdrawal")		// session의 회원정보 + 입력받은 파라미터(비밀번호)
		public String withdrawal(@ModelAttribute("loginMember") Member loginMember
							   , SessionStatus status
							   , HttpServletRequest req
							   , HttpServletResponse resp
							   , RedirectAttributes ra) {
			
			// 회원 탈퇴 서비스 호출
			int result = service.withdrawal(loginMember);
			System.out.println("result: " + result);
			
			String message = null;
			String path = null;
			
			if(result > 0) {
				message = "회원탈퇴 되었습니다.";
				path = "/main";
				
				// 세션 없애기
				status.setComplete();
				
				// 쿠키 없애기
				Cookie cookie = new Cookie("saveId", "");
				cookie.setMaxAge(0);
				cookie.setPath(req.getContextPath());
				resp.addCookie(cookie);
				
			}else {
				message = "회원탈퇴 실패";
				path = "secession";
			}
			
			ra.addFlashAttribute("message", message);
			logger.info("-----------------회원탈퇴---------------");
			
			return "redirect:" + path;
		}
		
	
	
	

}
