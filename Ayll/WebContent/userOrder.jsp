<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Order" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.ayll.Vo.Nurse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û����� | ��������</title>
</head>
<body>
	<% 
			UserDao userDao = new UserDao();
			String name = (String)session.getAttribute("AyllLoginName");
        	ArrayList<Order> orderList = userDao.getOrederByState(request.getParameter("state"),name);
        	
        	
        	for (Order order : orderList) {
        		
        	Nurse nurse = userDao.getNurseByID(order.getNurseID());
     %>
        <div class="orders">
            <div class="order-list">
                <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                <img class="order-ph" src="images/nurse/<%= nurse.getPicture() %>">
                <div class="order-id" style="display:inline-block;">
                    <p>������:&nbsp;&nbsp;<%= order.getOrderID() %></p>
                    <p>������&nbsp;<%= nurse.getNursename() %></p>
                    <p>���&nbsp;<%= nurse.getNursekind() %></p>
                    <p>����״̬��&nbsp;<%= order.getOrderState() %></p>
                </div>
                </a>
                <div class="order-a" style="color:#7d7d7d;">
                    <p>�������ڣ�<%= order.getOrderTime() %></p>
                    <% if (order.getOrderState().equals("����ԤԼ") || order.getOrderState().equals("��ԤԼ")) { %>
                      <button class="btn btn-sm" data-toggle="modal" data-target="#cancel" style="color:#f2f2f2;background-color:#23ac3a;">ȡ������</button>
               		<% } %>
                    <div class="modal fade" id="cancel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">�Ƿ�ȷ��ȡ��������&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "CancelOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "��">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">��</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
    		<% if (order.getOrderState().equals("�����")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#delete" style="color:#f2f2f2;background-color:#23ac3a;">ɾ������</button>
            <% } %>
              <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">�Ƿ�ȷ��ɾ��������&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "DeleteOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "��">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">��</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("�����")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#evaluate" style="color:#f2f2f2;background-color:#23ac3a;">����</button>
             <% } %>
			<div class="modal fade" id="evaluate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">����&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
                            <form role="form" action="EvaluateServlet" method="post">
                                    <div style="margin:10px 0px;">
                                      	 ����<input type="radio" name="level" value="����">
                                                                                                                         ����<input type="radio" name="level" value="����">
                                       	 ����<input type="radio" name="level" value="����">
                                    </div>
                                    <div class="form-group has-success" style="margin:10px 0px;">
                                        <span style="float:left;">�������ݣ�</span>
                                        <textarea class="form-control" name="content" rows="3"></textarea> 
                                    </div>
                                    <input type="hidden" name="nurseID" value="<%= nurse.getNurseID() %>">
                                    <input type="hidden" name="clientName" value="<%= name %>">
                                    <input type="hidden" name="url" value="<%= request.getParameter("url") %>">
                                    <div style="margin:10px 0px;">
                                        <input type="submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value="�ύ">
                                    </div>
                            </form>
                        </div>
		            </div>
	            </div>
             </div>

                </div>
            </div>
        </div>
        <% } %>

</body>
</html>