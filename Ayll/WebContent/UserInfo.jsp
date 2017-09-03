<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û���Ϣ</title>
</head>
<body>
	<%
		String userName = (String)session.getAttribute("AyllLoginName");
		if(userName == null) {
	%>
		<div id="in-up">
                <button class="btn btn-sm" data-toggle="modal" data-target="#modal1">��¼</button>
                <button class="btn btn-sm" onclick="window.location='register.jsp';">ע��</button>
                
                <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:100px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">��¼&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
                            <form action = "UserLoginServlet" method = "post">
                                <input type="text" id="userName" name="userName" placeholder="�û���/�ֻ���/����">
                                <span id = "msg"></span>
                                <input type="password" id="userPassword" name="userPassword" placeholder="����">
                                <% if(request.getParameter("infor") != null) { %>
                                <input type = "hidden" name = "url" value = "<%= request.getParameter("url") %>?infor=<%= request.getParameter("infor") %>">
                                <% } else { %>
                                <input type = "hidden" name = "url" value = "<%= request.getParameter("url") %>">
                                <% } %>
                                <div id="auth" style="padding:10px;">
                                    <input type="text" id="auth-code" name="auth-code" placeholder="��֤��">
                                    <span class="glyphicon glyphicon-refresh" style="color:#d2d2d2;font-size:15px;"></span>
                                    <img src="images/auth-code.png" style="width:90px; height:40px;">
                                </div>
                                <a href="psdfoget.jsp" style="float:right; font-size:10px; color:#c1c1c1;">��������?&nbsp;</a>
                                <input type="submit" id="in" value="��¼">
                            </form>
                        </div>
		            </div>
	            </div>
             </div>

                <div >
            </div>
        </div>
        <% } else { %>
        <div class="client" style="position:relative; left:1250px; width:70px; height:70px;">
               <a href="client.jsp">
                    <img src="images/user/<%= session.getAttribute("AyllLoginImage") %>" class="img-circle" style="width:50px;height:50px;margin:10px;">
               </a>
               <div class="per-card center">
                   <img src="images/user/<%= session.getAttribute("AyllLoginImage") %>" class="img-circle" style="width:80px;height:80px;margin:10px;">
                   &nbsp;<%= session.getAttribute("AyllLoginName") %>
                   <div class="per-link">
                       <a href="client.jsp"><i class="fa fa-file"></i> �ҵĶ���</a>
                       <a href="client.jsp"><i class="fa fa-home fa-lg"></i>���˿ռ�</a>
                   </div>
                   <div class="per-link">
                       <a href="collection.jsp"><i class="fa fa-cog fa-lg"></i> �ҵ��ղ�</a>
                       <form action = "UserExitServlet" method = "post" style="display:inline-block">
                       		<input type = "hidden" name = "url" value = "<%= request.getParameter("url") %>"/>
                       		<input type = "submit" value = "�˳��˻�" class="exit">
                       </form>
                   </div>
               </div>
           </div>
          <% } %> 
</body>
</html>