package kh.fin.giboo.common.filter;

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



@WebFilter(filterName = "initFilter", urlPatterns ="/*")

public class InitFilter extends HttpFilter implements Filter {
 
	// println으로 콘솔체크안함
	// Logger / Debug Mode 사용
	// Logger 객체 생성 ( 해당 클래스에 대한 log를 출력하는 객체 ) 
	private Logger logger = LoggerFactory.getLogger(InitFilter.class);
	
	
	// 필터가 생성될 때 실행
	public void init(FilterConfig fConfig) throws ServletException {
		// logger를 이용해서 출력하는 방법
		// trace - debug - info - warn - error
		// 범위를 말함
		// debug info error만 주로 사용한다.
		
		// debug : 개발의 흐름 파악할 떄 사용 ( 해당 코드가 실행이 되었는지, 파라미터가 현재 무슨 값인지 확인할 때 )
		// info : 메소드가 실행되었는지 파악할 떄 사용
		logger.info("초기화 필터 생성");
	}

 
	// 필터가 파괴될 때 ( 서버는 켜져 있지만 백앤드 코드 수정되었을 때 )
	public void destroy() {
		logger.info("필터 파괴");
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// application 내장 객체 얻어오기
				ServletContext application = request.getServletContext();
				
				// 최상위 주소 얻어오기
				String contextPath =  ( (HttpServletRequest)request ).getContextPath();
											// 다운캐스팅
				// 세팅
				application.setAttribute("contextPath", contextPath);
		
		chain.doFilter(request, response);
	}


}
