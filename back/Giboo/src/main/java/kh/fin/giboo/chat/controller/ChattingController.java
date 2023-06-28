package kh.fin.giboo.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.fin.giboo.chat.model.service.ChatService;
import kh.fin.giboo.chat.model.vo.ChatMessage;
import kh.fin.giboo.chat.model.vo.ChatRoom;
import kh.fin.giboo.chat.model.vo.ChatRoomJoin;
import kh.fin.giboo.member.model.vo.Member;

@Controller
public class ChattingController {
	
	@Autowired
	private ChatService service;
	
		// 채팅방 목록 조회
		@GetMapping("/chat/roomList")
		public String chattingList(Model model) {
			
			List<ChatRoom> chatRoomList = service.selectChatRoomList();
			
			model.addAttribute("chatRoomList", chatRoomList);
			
			return "chat/chatRoomList";
		}
		
		// 채팅방 생성과 동시에 입장
		@PostMapping("/chat/openChatRoom")
		public String openChatRoom(@ModelAttribute("loginMember") Member loginMember, Model model, 
		                            ChatRoom room, RedirectAttributes ra) {
		    
		    room.setMemberNo(loginMember.getMemberNo());
		    
		    int chatRoomNo = service.openChatRoom(room);
		    
		    String path = "redirect:/chat/";
		    
		    if(chatRoomNo > 0) {
		    	
		        // ChatrommJoin 객체 생성
		        ChatRoomJoin join = new ChatRoomJoin();
		        join.setChatRoomNo(chatRoomNo);
		        join.setMemberNo(loginMember.getMemberNo());
		        
		        List<ChatMessage> list = service.joinChatRoom(join);
		        if (list != null) {
		            model.addAttribute("list", list);
		            model.addAttribute("chatRoomNo", chatRoomNo); // 세션 생성
		            return "chat/chatRoom";
		        } else {
		            ra.addFlashAttribute("message", "채팅방 입장 실패");
		        }
		    } else {
		        ra.addFlashAttribute("message","채팅방 만들기 실패");
		    }
		    
		    return path + "roomList";
		}
		
		// 채팅방 나가기
		@GetMapping("/chat/exit")
		@ResponseBody
		public int exitChatRoom(@ModelAttribute("loginMember") Member loginMember,
								ChatRoomJoin join) {
			join.setMemberNo(loginMember.getMemberNo());
			
			return service.exitChatRoom(join);
		}
		
}
