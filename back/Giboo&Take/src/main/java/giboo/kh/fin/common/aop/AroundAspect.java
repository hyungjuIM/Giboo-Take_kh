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
//	// @Around : ?��처리(@Before)?? ?��처리(@After)�? ?�� 번에 ?��?�� �??��?�� advice
//
//	@Around("CommonPointcut.implPointcut()")
//	public Object runningTime(ProceedingJoinPoint jp) throws Throwable{
//
//		// ProceedingJoinPoint ?��?��?��?��?�� : ?��/?�� 처리 �??�� 기능, 값을 ?��?��?�� ?�� ?��?�� 메서?�� ?���?
//
//		// proceed() 메소?�� ?���? ?��  : @Before advice ?��?��
//		// proceed() 메소?�� ?���? ?��  : @After advice ?��?��
//		// 메소?�� 마�?막에 proceed()?�� 반환값을 리턴?��?��?��.
//
//		// System.currentTimeMillis() :
//		//	1970/01/01 ?��?�� 9?��(?���? OS 기�?) �??��
//		//  �?금까�? �??�� ?��간을 ms?��?���? ?��???�� �?
//
//		long startMs = System.currentTimeMillis();
//
//		Object obj = jp.proceed(); // ?��/?�� 처리�? ?��?��?�� 기�?
//
//		long endMs = System.currentTimeMillis();
//
//		logger.info("Running Time : " + (endMs - startMs) + "ms");
//
//		return obj;
//	}
//}
