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
//		// jp.getTarget() : aop�? ?��?��?�� 객체(각종 ServiceImpl)
//		String className = jp.getTarget().getClass().getSimpleName(); // 간단?�� ?��?��?���?(?��?���?�? ?��?��)
//
//		// jp.getSignature() : ?��?��?��?�� 메서?�� ?���?
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
