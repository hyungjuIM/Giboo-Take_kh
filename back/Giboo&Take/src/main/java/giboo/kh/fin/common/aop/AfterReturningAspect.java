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
//@Order(5) // ?° ?ˆ«? ?ˆœ?œ¼ë¡? ë¨¼ì? ?‹¤?–‰
//public class AfterReturningAspect {
//	private Logger logger = LoggerFactory.getLogger(AfterReturningAspect.class);
//
//
//	// @AfterReturning : ê¸°ì¡´ @After + ë°˜í™˜ê°? ?–»?–´?˜¤ê¸? ê¸°ëŠ¥
//	// returning="returnObj" : ë°˜í™˜ ê°’ì„ ???¥?•  ë§¤ê°œë³??ˆ˜ë¥? ì§?? •
//
//	@AfterReturning(pointcut = "CommonPointcut.implPointcut()", returning="returnObj")
//	public void serviceReturnValue(Object returnObj) {
//
//		logger.info("Return Value : " + returnObj);
//	}
//}
