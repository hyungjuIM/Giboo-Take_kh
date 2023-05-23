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
	
	// Logger / Debug Mode ?��?��
	
	// Logger 객체 ?��?�� (?��?�� ?��?��?��?�� ???�� log�? 출력?��?�� 객체)
	private Logger logger = LoggerFactory.getLogger(InitFilter.class);
	
	// ?��?���? ?��?��?�� ?�� ?��?��
	public void init(FilterConfig fConfig) throws ServletException {
		// logger�? ?��?��?��?�� 출력?��?�� 방법
		// trace - debug - info - warn - error
		// debug info error 주로 ?��?��
		
		// debug : 개발?�� ?���? ?��?��?��?�� ( ?��?�� 코드�? ?��?��?�� ?��?��?���? , ?��?��미터�? ?��?�� 무슨 값인�? ?��?��?�� ?�� )
		// info : 메소?�� ?��?�� ?��?��
		
		logger.info("초기?�� ?��?�� ?��?��");
	}

	// ?��?���? ?��괴될 ?�� ?��?��(?��버는 켜져?��?��?�� 백엔?�� 코드 ?��?��?��?��?�� ?��)
	public void destroy() {
		logger.info("초기?�� ?��?�� ?���?");
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// application ?��?�� 객체 ?��?��?���?
		ServletContext application = request.getServletContext();
		
		// 최상?�� 주소 ?��?��?���?
		String contextPath =  ( (HttpServletRequest)request ).getContextPath();
									// ?��?��캐스?��
		// ?��?��
		application.setAttribute("contextPath", contextPath);

		
		chain.doFilter(request, response);
	}

	

}
