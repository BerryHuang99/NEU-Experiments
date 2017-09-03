package com.ayll.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayll.dao.UserDao;

/**
 * Servlet implementation class UserInterestServlet
 */
@WebServlet("/UserInterestServlet")
public class UserInterest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInterest() {
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
		
		String[] interest = request.getParameterValues("affection");
		String userName = request.getParameter("userName");
		String interests = interest[0] + "_";
		UserDao userDao = new UserDao();
		
		for (int i = 1; i < interest.length; i++) {
			interests += (i == interest.length- 1) ? interest[i] : interest[i] + "_" ;
		}
		
		userDao.addInterest(userName, interests);
		
		request.getRequestDispatcher("/register_4.jsp").forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
