//package kh.fin.giboo.mypage.controller;
//
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import kh.fin.giboo.member.model.vo.Member;
//import kh.fin.giboo.mypage.model.vo.Favorite;

// 즐겨찾기 컨트롤러
//@Controller
//@RequestMapping("/mypage")
//@SessionAttributes({ "loginMember" })
//public class FavoriteController {
//	private Logger logger = LoggerFactory.getLogger(FavoriteController.class);
//	
//	@Autowired
//	//private FavoriteService service;
//	
//	@PostMapping("/addfavorite")
//	public String addfavorite(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp
//			, Model model
//			,@ModelAttribute("loginMember") Member loginMember
//			) {
//		int memberNo = loginMember.getMemberNo();
//		
//		//List<Favorite> addFavorite = service.addFavorite(cp,model);
//		
//		
//				return null;
//		
//	}
//	
//}
