package com.ayll.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ayll.Vo.Nurse;
import com.ayll.dao.NurseDao;

/**
 * Servlet implementation class NurseLoginServlet
 */
@WebServlet("/NurseLoginServlet")
public class NurseLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NurseLogin() {
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
		
		String nurseName = request.getParameter("nurseName");
		String nursePassword = request.getParameter("nursePassword");
		String message = "�û��������������";
		Nurse nurse = new Nurse();
		HttpSession session = request.getSession();
		NurseDao nurseDao = new NurseDao();
		
		if(nurseName.equals(nursePassword)) {
		
			nurse = nurseDao.judgeUserPassword(nurseName);
			
			if(nurse != null) {
				
				session.setAttribute("AyllNurseID", nurse.getNurseID());
				response.sendRedirect("nurse.jsp");
			}
				
		} else {
			
			request.setAttribute("message", message);
			request.getRequestDispatcher("nurseLogin.jsp").forward(request, response);
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
