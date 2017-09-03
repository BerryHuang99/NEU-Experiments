<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "com.ayll.Vo.Evaluates" %>
<%@ page import = "com.ayll.Vo.Evaluate" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDao userDao = new UserDao();
		Evaluates evaluates = userDao.getEvaluates(request.getParameter("nurseID"));
		
		for(Evaluate e : evaluates.getEvaluates()) {
			
			String picture = userDao.getuserImage(e.getClientName());
	%>
	
	<div class="e-list">
                <div class="e-head center">
                     <img class="e-ph img-circle" src="images/user/<%= picture %>">
                     <p><%= e.getClientName() %></p>
                </div>
                <div class="e-body">
                    <div class="content">
                        <p>评论内容</p>
                        <p><%= e.getContent() %></p>
                    </div>
                    <div class="e-title">
                        <p><%= e.getDate() %></p>
                        <p><span style="color:#272727;"><%= e.getLevel() %></span></p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
      <% } %>
</body>
</html>