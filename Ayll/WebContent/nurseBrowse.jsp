<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Nurse" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>阿姨信息浏览</title>
</head>
<body>
	<%
		UserDao userDao = new UserDao();
		ArrayList<Nurse> nurses = new ArrayList<Nurse>();
		if(request.getParameter("nurseKind") != null)
			nurses = userDao.getNurseByKind(request.getParameter("nurseKind"));
		else
			nurses = userDao.getNurseByKind(request.getParameter("infor"));
		
		for (Nurse nurse : nurses) {
	%>
	<div class="synopsis">
         	<a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
            	<div class="head"><img src="images/nurse/<%= nurse.getPicture() %>"></div>
                <div class="starability-container">
                	<form>
                    	<fieldset class="starability-basic">
                    	<span style="padding:0px 10px;">星级：</span>
                        	<% 
                            	int star = nurse.getStar();
                                    	
                                for (int i = 5; i > 0; i--) {
                                        			
                                if(i == star) {
                            %>
                                    	
                            <input type="radio" id="rate<%= star %>-1" name="rating" value="<%= star %>" checked="checked" disabled />
                            <label for="rate<%= star %>-1"><%= star %> stars</label>
                                        
                           	<% } else { %>
                                        			
                            <input type="radio" id="rate<%= star %>-1" name="rating" value="<%= star %>" disabled />
                            <label for="rate<%= star %>-1"><%= star %> stars</label>
                                                	
                            <% 
                                    }
                            	}
                            %>
                        </fieldset>
                 	</form>
             	</div>
                <p>
                	<span>服务类型：</span><%= nurse.getNursekind() %><br>
                	<span>服务地区：</span><%= nurse.getNurseArea() %><br>
                	<span>简介：</span><%= nurse.getInformation() %>
                </p>
         	</a>
            <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>" class="order"><img src="images/order.png"></a>
     	</div>
	<% } %>
</body>
</html>