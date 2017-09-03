package com.ayll.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter(
		urlPatterns = { "/*" }, 
		servletNames = { 
				"UserExitServlet", 
				"UserInterestServlet", 
				"UserLoginServlet", 
				"UserRegisterServlet",
				"CancelOrderServlet",
				"DeleteOrderServlet",
				"EvaluateServlet",
				"ForgetPasswordServlet",
				"NurseAccomplishServlet",
				"NurseAgreeServlet",
				"NurseCancelServlet",
				"NurseDeleteServlet",
				"NurseExitServlet",
				"NurseLoginServlet",
				"UserCollectionServlet",
				"UserExitServlet",
				"UserIndentServlet",
				"UserInterestServlet"
		})
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
