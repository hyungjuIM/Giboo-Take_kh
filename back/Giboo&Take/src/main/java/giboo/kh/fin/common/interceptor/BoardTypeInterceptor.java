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
//	/* ?¸?„°?…‰?„°ê°? ?š”ì²??„ ê°?ë¡œì±„?Š” ?‹œê¸?
//	 *
//	 * 1. preHandle (? „ì²˜ë¦¬) : ì»¨íŠ¸ë¡¤ëŸ¬ ?ˆ˜?–‰ ? „
//	 *
//	 * 2. postHandle (?›„ì²˜ë¦¬) : ì»¨íŠ¸ë¡¤ëŸ¬ ?ˆ˜?–‰ ?›„ (ì»¨íŠ¸ë¡¤ëŸ¬ ?ˆ˜?–‰ ê²°ê³¼ ì°¸ì¡° ê°??Š¥)
//	 *
//	 * 3. afterCompletion (View?‹¨ ì²˜ë¦¬ ?›„) : ë³´í†µ ??› ë°˜í™˜( close() )?„ ?ˆ˜?–‰
//	 *
//	 * ** ?‹¨, ë¹„ë™ê¸? ?š”ì²?(?ë°? ?‚´ë¶??˜ ë³„ë„ ?“°? ˆ?“œ ?š”ì²?)?? ê°?ë¡œì±„ì§? ?•Š?Œ
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
//		//logger.info("? „ì²˜ë¦¬ ?ˆ˜?–‰");
//
//		// application scope?— "boardTypeList"ê°? ?—†?„ ê²½ìš°
//		// ?´ë¥? ì¡°íšŒ?•˜?Š” Service ?˜¸ì¶? ?›„ ê²°ê³¼ë¥? ?„¸?Œ…
//
//		// application scope ê°ì²´ ?–»?–´?˜¤ê¸?
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
//		logger.info("?›„ì²˜ë¦¬ ?ˆ˜?–‰");
//
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//
//		logger.info("View ì²˜ë¦¬ ?™„ë£? ?›„ ?ˆ˜?–‰");
//
//		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
//	}
//
//
//}
