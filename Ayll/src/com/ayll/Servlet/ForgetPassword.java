package com.ayll.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayll.dao.UserDao;

/**
 * Servlet implementation class ForgetPasswordServlet
 */
@WebServlet("/ForgetPasswordServlet")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312");
		
		
		String name = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String psd1 = request.getParameter("correct");
		HttpSession session = request.getSession();
		String message = "’À∫≈ªÚ ÷ª˙∫≈¬ÎŒÛ";
		
		UserDao userDao = new UserDao();
		
			if(userDao.find(name, phone)) {
				
				userDao.userdo(name, psd1);
				session.setAttribute("AyllLoginName", null);
				session.setAttribute("AyllLoginImage", null);
				response.sendRedirect("userLogin.jsp");
			} else {
				
				request.setAttribute("message", message);
				response.sendRedirect("psdfoget.jsp");
			}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
