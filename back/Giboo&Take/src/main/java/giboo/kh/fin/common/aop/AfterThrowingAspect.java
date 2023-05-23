package giboo.kh.fin.common.aop;
//package com.kh.fin.common.aop;
//
//import org.aspectj.lang.annotation.AfterThrowing;
//import org.aspectj.lang.annotation.Aspect;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
//@Component
//@Aspect
//public class AfterThrowingAspect {
//	private Logger logger = LoggerFactory.getLogger(AfterThrowingAspect.class);
//
//
//	// @AfterThrowing : Í∏∞Ï°¥ @After + ?çò?†∏Ïß??äî ?òà?ô∏ ?ñª?ñ¥?ò§Í∏? Í∏∞Îä•
//	// throwing="exceptionObj" : ?çò?†∏Ïß? ?òà?ô∏Î•? ???û•?ï† Îß§Í∞úÎ≥??àòÎ•? Ïß??†ï
//
//	@AfterThrowing(pointcut = "CommonPointcut.implPointcut()", throwing="exceptionObj")
//	public void serviceReturnValue(Exception exceptionObj) {
//
//		String str = "<<exception>> : " + exceptionObj.getStackTrace()[0];
//
//		str += " - " + exceptionObj.getMessage();
//
//		logger.error(str);
//	}
//}
