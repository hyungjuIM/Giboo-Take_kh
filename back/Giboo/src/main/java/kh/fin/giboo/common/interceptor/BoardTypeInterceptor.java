//package kh.fin.giboo.common.interceptor;
//
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//
//
//// 여기서 interceptor해서 boardType을 가져와서
//// 저장 할 수 있게 처리해준다.
//// servlet-context ( dispatcher Servelt ) 
//
//// 상속
//public class BoardTypeInterceptor implements HandlerInterceptor{
//
//	/* 인터셉터가 요청을 가로채는 시기
//	 *
//	 * 1. preHandle ( 전처리 ) : controller 수행 前
//	 * 
//	 * 2. postHandle ( 후처리 ) : controller 수행 後 ( controller 수행 결과 참조 가능 )
//	 * 
//	 * 3. afterComletion ( view단 처리 후 ) : 보통 자원 반환( close )을 수행
//	 * 
//	 * 
//	 ********* 단 비동기 요청 ({@ajax가아님} 자바 내부의 별도 쓰레드 요청 )은 가로채지 않는다.
//	 * 
//	 */
//	
//	private Logger logger = LoggerFactory.getLogger(BoardTypeInterceptor.class);
//	
////	@Autowired
////	private BoardService boardService;
//	
//	
//	@Override //전 처리
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//	
//		// 가장 최상단의 scope인
//		// application scope에 "boardTypeList"가 없을 경우에
//		// 이를 조회하는 Service 호출 후 결과를 세팅	
//		
//		// application scope 객체 얻어오기
//		ServletContext application =  request.getServletContext();
//		
//		//boardTypeList를 얻어와서 null이면
//		
//		if (application.getAttribute("boardTypeList") == null) {
//		/*Generic*/	List<BoardType> boardTypeList = boardService.selectBoardType();			
//			application.setAttribute("boardTypeList", boardTypeList);
//														// JSP의 ${boardType의boardCode}
//		}
//			
//		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
//
//	@Override // 후 처리
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//		logger.info("후처리 수행");
//		
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}
// 
//	@Override // VIEW 처리
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		
//		logger.info("View 처리 완료 후 수행");
//		
//		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
//	}
//	
//}
