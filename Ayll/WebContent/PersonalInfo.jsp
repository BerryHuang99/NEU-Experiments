<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<%@ page import = "com.ayll.Vo.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
	<%
		String userName = (String)session.getAttribute("AyllLoginName");
		UserDao userDao = new UserDao();
		User user = new User();
		
		user = userDao.findUser(userName);
	%>
    <div class="per-title">
        <div class="per-ph img-circle">
            <img src="images/user/<%= user.getUserimage() %>" class="img-circle" style="width:100px; heigth:100px;background-color:#f2f2f2;border:3px #fff solid;">
            <a href="#" style="color:#f2f2f2;position:relative;bottom:20px;"><li class="fa fa-cog"></li></a>
        </div>
        <div class="per-info">
            <h2><%= user.getUsername() %></h2>
            <p><span>性别：</span><%= user.getSex() %></p>
            <p><span>木有个性签名~</span></p>
        </div>
    </div>
</body>
</html>