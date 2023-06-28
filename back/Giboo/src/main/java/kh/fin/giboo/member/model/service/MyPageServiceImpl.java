package kh.fin.giboo.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.fin.giboo.common.Util;
import kh.fin.giboo.member.model.dao.MyPageDAO;
import kh.fin.giboo.member.model.vo.Member;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	// 회원정보 변경
	@Override
	public int memberChange(Map<String, Object> paramMap){
		return dao.memberChange(paramMap);
	}
	
	// 비밀번호 변경 서비스 구형
		@Override
		public int changePw(Map<String, Object> paramMap) {

			paramMap.put("newPw",  bcrypt.encode( (String)paramMap.get("newPw") )  );
			return dao.changePw(paramMap);			
		}

		// 프로필 이미지 수정 서비스 구현
		@Override
		public int changeProfile(Map<String, Object> map) throws IOException {
			MultipartFile uploadImg = (MultipartFile) map.get("uploadImg");
			String delete = (String)map.get("delete"); // "0" (변경)  /  "1" (삭제)
			
			
			String renameImg = null; // 변경된 파일명 저장
			
			if( delete.equals("0") ) { // 이미지가 변경된 경우
				renameImg = Util.fileRename(uploadImg.getOriginalFilename());
				
				map.put("profileImg",   map.get("webPath") + renameImg ); 
			} else {			
				map.put("profileImg", null); //  null 값 준비
			}
			int result = dao.changeProfile(map); 
			
			// DB 수정 성공 시 메모리에 임시 저장되어있는 파일을 서버에 저장
			if(result > 0  &&  map.get("profileImg") != null ) {
				uploadImg.transferTo( new File( map.get("folderPath")  + renameImg   ) );
				// transferTo() : 해당 파일을 지정된 경로+이름으로 저장
			}			
			return result;
		}

		//회원탈퇴
		@Override
		public int withdrawal(Member loginMember) {
			return dao.withdrawal(loginMember.getMemberNo());
		}
}
