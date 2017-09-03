<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Order" %>
<%@ page import = "com.ayll.dao.NurseDao" %>
<%@ page import = "com.ayll.Vo.Nurse" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
	<%
		String nurseID = (String)session.getAttribute("AyllNurseID");
		NurseDao nurseDao = new NurseDao();
		
		Nurse nurse = nurseDao.getNurseByID(nurseID);
	%>
	<div class="client" style="position:relative; left:1250px; width:70px; height:70px;">
               <a href="#">
                    <img src="images/nurse/<%= nurse.getPicture() %>" class="img-circle" style="width:50px;height:50px;margin:10px;">
               </a>
               <div class="per-card center">
                   <img src="images/nurse/<%= nurse.getPicture() %>" class="img-circle" style="width:80px;height:80px;margin:10px;">
                   &nbsp;<%= nurse.getNursename() %>
                   <div class="per-link" style="position:relative; top:20px;">
                       <a href="nurse_3.jsp"><i class="fa fa-file"></i> 我的订单</a>
                       <form action = "NurseExitServlet" method = "post" style="display:inline-block">
                       		<input type = "submit" value = "退出账户" class="exit">
                       </form>
                   </div>
               </div>
           </div>
</body>
</html>