package com.ayll.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayll.Vo.User;
import com.ayll.dao.UserDao;


/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		
		User user = new User();
		UserDao userDao = new UserDao();
		
		String userPassword = request.getParameter("userPassword");
		String userSex = request.getParameter("userSex");
		String userTel = request.getParameter("userTel");
		String userName = request.getParameter("userName");
		
		user.setUsername(userName);
		user.setPassword(userPassword);
		user.setSex(userSex);
		user.setTel(userTel);
		user.setUserimage("default.jpg");
		
		User userJudge = userDao.judgeUserPassword(user.getTel(), user.getPassword());
		
		if(userJudge != null) {
			
			request.getRequestDispatcher("/Register.jsp").forward(request, response);
		} else {
			
			userDao.insertUser(user);
			request.setAttribute("userName", user.getUsername());
			request.getRequestDispatcher("/register_3.jsp").forward(request,  response);
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
