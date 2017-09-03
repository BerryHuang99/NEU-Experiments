package com.ayll.Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ayll.Vo.Order;
import com.ayll.dao.NurseDao;
import com.ayll.dao.UserDao;

/**
 * Servlet implementation class UserIndentServlet
 */
@WebServlet("/UserIndentServlet")
public class UserIndent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIndent() {
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
		
		String userName = request.getParameter("userName");
		String nurseID = request.getParameter("nurseID");
		String address = request.getParameter("address");
		String require = request.getParameter("require");
		String pay = request.getParameter("pay");
		String url = request.getParameter("url");
		
		UserDao userDao = new UserDao();
		NurseDao nurseDao = new NurseDao();
		Order order = new Order();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(d);
		
		order.setUserName(userName);
		order.setNurseID(nurseID);
		order.setAddress(address);
		order.setRequire(require);
		order.setPay(pay);
		order.setOrderTime(date);
		order.setOrderState("ÕýÔÚÔ¤Ô¼");
		
		if(userDao.addIndent(order) && nurseDao.addIndent(order))
			request.getRequestDispatcher("/client.jsp").forward(request, response);
		else
			response.sendRedirect(url);
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
