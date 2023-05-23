package giboo.kh.fin.common.aop;
//package com.kh.fin.common.aop;
//
//import java.util.Arrays;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import edu.kh.comm.member.model.vo.Member;
//
//@Component
//@Aspect
//public class BeforeAspect {
//	private Logger logger = LoggerFactory.getLogger(BeforeAspect.class);
//
//	// JoinPoint ?¸?„°?˜?´?Š¤ :
//	//		adviceê°? ? ?š©?˜?Š” Target Object (ServiceImpl)?˜
//	//		? •ë³?, ? „?‹¬?˜?Š” ë§¤ê°œë³??ˆ˜, ë©”ì„œ?“œ, ë°˜í™˜ê°?, ?˜ˆ?™¸ ?“±?„ ?–»?„ ?ˆ˜ ?ˆ?Š” ë©”ì„œ?“œë¥? ? œê³?
//
//	// (ì£¼ì˜?‚¬?•­) JoinPoint ?¸?„°?˜?´?Š¤?Š” ?•­?ƒ ì²? ë²ˆì§¸ ë§¤ê°œë³??ˆ˜ë¡? ?‘?„± ?˜?–´?•¼ ?•œ?‹¤!
//
//
//	@Before("CommonPointcut.implPointcut()")
//	public void serviceStart(JoinPoint jp) {
//
//		String str = "--------------------------------------\n";
//
//		// jp.getTarget() : aopê°? ? ?š©?œ ê°ì²´(ê°ì¢… ServiceImpl)
//		String className = jp.getTarget().getClass().getSimpleName(); // ê°„ë‹¨?•œ ?´?˜?Š¤ëª?(?Œ¨?‚¤ì§?ëª? ? œ?™¸)
//
//		// jp.getSignature() : ?ˆ˜?–‰?˜?Š” ë©”ì„œ?“œ ? •ë³?
//		String methodName = jp.getSignature().getName();
//
//		// jp.getArgs() : ë©”ì„œ?“œ ?˜¸ì¶? ?‹œ ? „?‹¬?œ ë§¤ê°œë³??ˆ˜
//		String param = Arrays.toString( jp.getArgs() );
//
//
//		str += "Start : " + className + " - " + methodName + "\n";
//		// Start : MemberServiceImpl - login
//
//		str += "Parameter : " + param + "\n";
//
//
//		try {
//			// HttpServletRequest ?–»?–´?˜¤ê¸?
//			// ?‹¨, ?Š¤?”„ë§? ?Š¤ì¼?ì¤„ëŸ¬ ?™?‘ ?‹œ ?˜ˆ?™¸ ë°œìƒ (?Š¤ì¼?ì¤„ëŸ¬?Š” ?š”ì²? ê°ì²´ê°? ì¡´ì¬?•˜ì§? ?•Š?Œ)
//			HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
//
//			Member loginMember = (Member)req.getSession().getAttribute("loginMember");
//
//			// ip : xxx.xxx.xxx.xxx (email : test01@naver.com)
//			str += "ip : " + getRemoteAddr(req);
//
//			if(loginMember != null) { // ë¡œê·¸?¸ ?ƒ?ƒœ?¸ ê²½ìš°
//				str += " (email : " + loginMember.getMemberEmail() + ")";
//			}
//
//
//		} catch( Exception e ) {
//			str += "[?Š¤ì¼?ì¤„ëŸ¬ ?™?‘]";
//		}
//
//
//		logger.info(str);
//	}
//
//
//
//	public static String getRemoteAddr(HttpServletRequest request) {
//
//        String ip = null;
//
//        ip = request.getHeader("X-Forwarded-For");
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("Proxy-Client-IP");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("WL-Proxy-Client-IP");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("HTTP_CLIENT_IP");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("X-Real-IP");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("X-RealIP");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getHeader("REMOTE_ADDR");
//        }
//
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//            ip = request.getRemoteAddr();
//        }
//
//		return ip;
//	}
//
//}
