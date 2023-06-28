//package kh.fin.giboo.member.controller;
//
//import java.io.IOException;
//import java.util.HashMap;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.LinkedMultiValueMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.client.RestTemplate;
//
//
//import kh.fin.giboo.member.model.dao.MemberDAO;
//import kh.fin.giboo.member.model.service.KakaoLoginService;
//import kh.fin.giboo.member.model.vo.KakaoProfile;
//import kh.fin.giboo.member.model.vo.OAuthToken;
//
//import com.fasterxml.jackson.core.JsonParseException;
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.JsonMappingException;
//import com.fasterxml.jackson.databind.JsonNode;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//@Controller
//@SessionAttributes({ "loginMember" })
//public class KakaoController {
//
//	@Autowired
//	private HttpSession session;
//	@Autowired
//	public KakaoLoginService service;
//	@Autowired
//	public MemberDAO dao;
//	
//	
//	@RequestMapping("/oauth/kakao")
//	public String kakaoLogin(Model model,@RequestParam(value = "code", required = false) String code) throws JsonMappingException, JsonProcessingException{
//		ObjectMapper objectMapper = new ObjectMapper();
//		
//		System.out.println("code:" + code);
//		RestTemplate rt =new RestTemplate();
//		
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
//		org.springframework.util.MultiValueMap<String, String> params =new LinkedMultiValueMap<>();
//		params.add("grant_type", "authorization_code");
//		params.add("client_id", "ca354a1ec30c6c06ea4746d8610afdf8");
//		params.add("redirect_uri", "http://localhost:8080/Giboo/oauth/kakao");
//		
//		params.add("code", code);
//		
//		org.springframework.http.HttpEntity<org.springframework.util.MultiValueMap<String,String>> kakaoTokenRequest =
//				new org.springframework.http.HttpEntity<>(params,headers);
//		
//		ResponseEntity<String> response =rt.exchange(
//				"https://kauth.kakao.com/oauth/token",
//				HttpMethod.POST,
//				kakaoTokenRequest,
//				String.class);
//		System.out.println(response);
//		String responseBody = response.getBody();
//		JsonNode jsonNode = objectMapper.readTree(responseBody);
//		String accessToken = jsonNode.get("access_token").asText();
//		OAuthToken oAuthToken = new OAuthToken();
//		RestTemplate rt2 = new RestTemplate();
//		HttpHeaders headers2 = new HttpHeaders();
//		headers2.add("Authorization", "Bearer " + accessToken);
//		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
//		
//		org.springframework.http.HttpEntity<org.springframework.util.MultiValueMap<String,String>> kakaoTokenRequest2 =
//				new org.springframework.http.HttpEntity<>(headers2);
//		
//		ResponseEntity<String> response2 =rt2.exchange(
//				"https://kapi.kakao.com/v2/user/me",
//				HttpMethod.POST,
//				kakaoTokenRequest2,
//				String.class);
//		System.out.println(response2.getBody());
//		ObjectMapper objectMapper2 = new ObjectMapper();
//		 String responseBody2 = response2.getBody();
//		String kakaoProfile =null;
//		try {
//			KakaoProfile profile = objectMapper2.readValue(responseBody2, KakaoProfile.class);
//			kakaoProfile = objectMapper2.writeValueAsString(profile);
//		}catch (JsonParseException e) {
//			e.printStackTrace();
//		}catch(JsonMappingException e) {
//			e.printStackTrace();
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.println("kakaoProfile : "+kakaoProfile);
//		HashMap<String, Object> userInfo = new HashMap<String, Object>();
//		JsonParser parser = new JsonParser();
//        JsonElement element = parser.parse(kakaoProfile); //Json element 문자열변경
//        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//        String email = kakao_account.getAsJsonObject().get("email").getAsString();
//        userInfo.put("nickname", nickname);
//        userInfo.put("email", email);
//        
//        KakaoProfile result = dao.findkakao(userInfo);
//        System.out.println("result : "+result);
//       if(result == null) {
//         dao.kakaoinsert(userInfo);}
//       else {
//    	   return "redirect:/main/login";
//       }
//     
//      System.out.println("업데이트 완료");
//	
//	return "redirect:/main";
//	}
//	
//}