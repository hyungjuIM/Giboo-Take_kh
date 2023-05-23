package giboo.kh.fin.common.interceptor;
//package edu.kh.comm.common.interceptor;
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
//import edu.kh.comm.board.model.service.BoardService;
//import edu.kh.comm.board.model.vo.BoardType;
//
//public class BoardTypeInterceptor implements HandlerInterceptor{
//
//	/* ?��?��?��?���? ?���??�� �?로채?�� ?���?
//	 *
//	 * 1. preHandle (?��처리) : 컨트롤러 ?��?�� ?��
//	 *
//	 * 2. postHandle (?��처리) : 컨트롤러 ?��?�� ?�� (컨트롤러 ?��?�� 결과 참조 �??��)
//	 *
//	 * 3. afterCompletion (View?�� 처리 ?��) : 보통 ?��?�� 반환( close() )?�� ?��?��
//	 *
//	 * ** ?��, 비동�? ?���?(?���? ?���??�� 별도 ?��?��?�� ?���?)?? �?로채�? ?��?��
//	 *
//	 * */
//
//	private Logger logger = LoggerFactory.getLogger(BoardTypeInterceptor.class);
//
//	@Autowired
//	private BoardService boardService;
//
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//
//		//logger.info("?��처리 ?��?��");
//
//		// application scope?�� "boardTypeList"�? ?��?�� 경우
//		// ?���? 조회?��?�� Service ?���? ?�� 결과�? ?��?��
//
//		// application scope 객체 ?��?��?���?
//		ServletContext application = request.getServletContext();
//
//		if( application.getAttribute("boardTypeList") == null ) {
//
//			List<BoardType> boardTypeList = boardService.selectBoardType();
//
//			application.setAttribute("boardTypeList", boardTypeList);
//		}
//
//
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//
//		logger.info("?��처리 ?��?��");
//
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//
//		logger.info("View 처리 ?���? ?�� ?��?��");
//
//		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
//	}
//
//
//}
