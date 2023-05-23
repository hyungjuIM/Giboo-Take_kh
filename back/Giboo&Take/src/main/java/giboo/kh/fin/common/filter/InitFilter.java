package giboo.kh.fin.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@WebFilter(filterName = "initFilter", urlPatterns = "/*")
public class InitFilter extends HttpFilter implements Filter {
	
	// Logger / Debug Mode ?‚¬?š©
	
	// Logger ê°ì²´ ?ƒ?„± (?•´?‹¹ ?´?˜?Š¤?— ???•œ logë¥? ì¶œë ¥?•˜?Š” ê°ì²´)
	private Logger logger = LoggerFactory.getLogger(InitFilter.class);
	
	// ?•„?„°ê°? ?ƒ?„±?  ?•Œ ?‹¤?–‰
	public void init(FilterConfig fConfig) throws ServletException {
		// loggerë¥? ?´?š©?•´?„œ ì¶œë ¥?•˜?Š” ë°©ë²•
		// trace - debug - info - warn - error
		// debug info error ì£¼ë¡œ ?‚¬?š©
		
		// debug : ê°œë°œ?˜ ?ë¦? ?ŒŒ?•…?• ?•Œ ( ?•´?‹¹ ì½”ë“œê°? ?‹¤?–‰?´ ?˜?—ˆ?Š”ì§? , ?ŒŒ?¼ë¯¸í„°ê°? ?˜„?¬ ë¬´ìŠ¨ ê°’ì¸ì§? ?™•?¸?•  ?•Œ )
		// info : ë©”ì†Œ?“œ ?‹¤?–‰ ?ŒŒ?•…
		
		logger.info("ì´ˆê¸°?™” ?•„?„° ?ƒ?„±");
	}

	// ?•„?„°ê°? ?ŒŒê´´ë  ?•Œ ?‹¤?–‰(?„œë²„ëŠ” ì¼œì ¸?ˆ?Š”?° ë°±ì—”?“œ ì½”ë“œ ?ˆ˜? •?˜?—ˆ?„ ?•Œ)
	public void destroy() {
		logger.info("ì´ˆê¸°?™” ?•„?„° ?ŒŒê´?");
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// application ?‚´?¥ ê°ì²´ ?–»?–´?˜¤ê¸?
		ServletContext application = request.getServletContext();
		
		// ìµœìƒ?œ„ ì£¼ì†Œ ?–»?–´?˜¤ê¸?
		String contextPath =  ( (HttpServletRequest)request ).getContextPath();
									// ?‹¤?š´ìºìŠ¤?Œ…
		// ?„¸?Œ…
		application.setAttribute("contextPath", contextPath);

		
		chain.doFilter(request, response);
	}

	

}
