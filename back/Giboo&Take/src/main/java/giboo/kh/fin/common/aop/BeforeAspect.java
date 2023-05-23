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
//	// JoinPoint ?��?��?��?��?�� :
//	//		advice�? ?��?��?��?�� Target Object (ServiceImpl)?��
//	//		?���?, ?��?��?��?�� 매개�??��, 메서?��, 반환�?, ?��?�� ?��?�� ?��?�� ?�� ?��?�� 메서?���? ?���?
//
//	// (주의?��?��) JoinPoint ?��?��?��?��?��?�� ?��?�� �? 번째 매개�??���? ?��?�� ?��?��?�� ?��?��!
//
//
//	@Before("CommonPointcut.implPointcut()")
//	public void serviceStart(JoinPoint jp) {
//
//		String str = "--------------------------------------\n";
//
//		// jp.getTarget() : aop�? ?��?��?�� 객체(각종 ServiceImpl)
//		String className = jp.getTarget().getClass().getSimpleName(); // 간단?�� ?��?��?���?(?��?���?�? ?��?��)
//
//		// jp.getSignature() : ?��?��?��?�� 메서?�� ?���?
//		String methodName = jp.getSignature().getName();
//
//		// jp.getArgs() : 메서?�� ?���? ?�� ?��?��?�� 매개�??��
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
//			// HttpServletRequest ?��?��?���?
//			// ?��, ?��?���? ?���?줄러 ?��?�� ?�� ?��?�� 발생 (?���?줄러?�� ?���? 객체�? 존재?���? ?��?��)
//			HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
//
//			Member loginMember = (Member)req.getSession().getAttribute("loginMember");
//
//			// ip : xxx.xxx.xxx.xxx (email : test01@naver.com)
//			str += "ip : " + getRemoteAddr(req);
//
//			if(loginMember != null) { // 로그?�� ?��?��?�� 경우
//				str += " (email : " + loginMember.getMemberEmail() + ")";
//			}
//
//
//		} catch( Exception e ) {
//			str += "[?���?줄러 ?��?��]";
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
