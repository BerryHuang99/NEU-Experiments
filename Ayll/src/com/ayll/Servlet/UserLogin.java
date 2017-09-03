package com.ayll.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayll.Vo.User;
import com.ayll.dao.UserDao;


/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		
		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String url = request.getParameter("url");
		String message = "用户名或者密码错误！";
		
		UserDao userDao = new UserDao();
		User user = userDao.judgeUserPassword(userName, userPassword);
		
		if(user == null) {
			
			request.setAttribute("name", userName);
			request.setAttribute("message", message);
			request.getRequestDispatcher("/userLogin.jsp").forward(request, response);
		} else {
			
			session.setAttribute("AyllLoginName", user.getUsername());
			session.setAttribute("AyllLoginImage", user.getUserimage());
			session.setMaxInactiveInterval(3600);
			request.getRequestDispatcher("/" + url).forward(request, response);
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
