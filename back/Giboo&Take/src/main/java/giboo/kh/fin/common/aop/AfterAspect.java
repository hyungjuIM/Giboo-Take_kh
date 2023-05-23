package giboo.kh.fin.common.aop;
//package com.kh.fin.common.aop;
//
//import java.util.Arrays;
//
//import org.springframework.core.annotation.Order;
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.After;
//import org.aspectj.lang.annotation.Aspect;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//@Component
//@Aspect
//@Order(1)
//public class AfterAspect {
//
//	private Logger logger = LoggerFactory.getLogger(AfterAspect.class);
//
//
//	@After("CommonPointcut.implPointcut()")
//	public void serviceEnd(JoinPoint jp) {
//
//
//		// jp.getTarget() : aopÍ∞? ?†Å?ö©?êú Í∞ùÏ≤¥(Í∞ÅÏ¢Ö ServiceImpl)
//		String className = jp.getTarget().getClass().getSimpleName(); // Í∞ÑÎã®?ïú ?Å¥?ûò?ä§Î™?(?å®?Ç§Ïß?Î™? ?†ú?ô∏)
//
//		// jp.getSignature() : ?àò?ñâ?êò?äî Î©îÏÑú?ìú ?†ïÎ≥?
//		String methodName = jp.getSignature().getName();
//
//
//		String str = "End : " + className + " - " + methodName + "\n";
//		// End :  : MemberServiceImpl - login
//
//
//		str += "--------------------------------------\n";
//
//		logger.info(str);
//	}
//}
