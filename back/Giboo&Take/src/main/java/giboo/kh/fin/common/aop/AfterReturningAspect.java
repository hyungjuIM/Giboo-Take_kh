package giboo.kh.fin.common.aop;
//package com.kh.fin.common.aop;
//
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.Aspect;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.core.annotation.Order;
//import org.springframework.stereotype.Component;
//
//@Component
//@Aspect
//@Order(5) // ?�� ?��?�� ?��?���? 먼�? ?��?��
//public class AfterReturningAspect {
//	private Logger logger = LoggerFactory.getLogger(AfterReturningAspect.class);
//
//
//	// @AfterReturning : 기존 @After + 반환�? ?��?��?���? 기능
//	// returning="returnObj" : 반환 값을 ???��?�� 매개�??���? �??��
//
//	@AfterReturning(pointcut = "CommonPointcut.implPointcut()", returning="returnObj")
//	public void serviceReturnValue(Object returnObj) {
//
//		logger.info("Return Value : " + returnObj);
//	}
//}
