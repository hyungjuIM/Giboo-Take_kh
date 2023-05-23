package giboo.kh.fin.common.aop;
//package com.kh.fin.common.aop;
//
//import org.springframework.core.annotation.Order;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//@Component
//@Aspect
//@Order(3)
//public class AroundAspect {
//	private Logger logger = LoggerFactory.getLogger(AroundAspect.class);
//
//	// @Around : ? „ì²˜ë¦¬(@Before)?? ?›„ì²˜ë¦¬(@After)ë¥? ?•œ ë²ˆì— ?‘?„± ê°??Š¥?•œ advice
//
//	@Around("CommonPointcut.implPointcut()")
//	public Object runningTime(ProceedingJoinPoint jp) throws Throwable{
//
//		// ProceedingJoinPoint ?¸?„°?˜?´?Š¤ : ? „/?›„ ì²˜ë¦¬ ê´?? ¨ ê¸°ëŠ¥, ê°’ì„ ?–»?–´?˜¬ ?ˆ˜ ?ˆ?Š” ë©”ì„œ?“œ ? œê³?
//
//		// proceed() ë©”ì†Œ?“œ ?˜¸ì¶? ? „  : @Before advice ?‘?„±
//		// proceed() ë©”ì†Œ?“œ ?˜¸ì¶? ?›„  : @After advice ?‘?„±
//		// ë©”ì†Œ?“œ ë§ˆì?ë§‰ì— proceed()?˜ ë°˜í™˜ê°’ì„ ë¦¬í„´?•´?•¼?•¨.
//
//		// System.currentTimeMillis() :
//		//	1970/01/01 ?˜¤? „ 9?‹œ(?•œêµ? OS ê¸°ì?) ë¶??„°
//		//  ì§?ê¸ˆê¹Œì§? ì§??‚œ ?‹œê°„ì„ ms?‹¨?œ„ë¡? ?‚˜???‚¸ ê°?
//
//		long startMs = System.currentTimeMillis();
//
//		Object obj = jp.proceed(); // ? „/?›„ ì²˜ë¦¬ë¥? ?‚˜?ˆ„?Š” ê¸°ì?
//
//		long endMs = System.currentTimeMillis();
//
//		logger.info("Running Time : " + (endMs - startMs) + "ms");
//
//		return obj;
//	}
//}
