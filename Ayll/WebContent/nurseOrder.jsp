<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Order" %>
<%@ page import = "com.ayll.dao.NurseDao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.ayll.Vo.Nurse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
</head>
<body>
	<% 
		NurseDao nurseDao = new NurseDao();
		String nurseID = (String)session.getAttribute("AyllNurseID");
		ArrayList<Order> orderList = nurseDao.getOrederByState(request.getParameter("state"), nurseID);
		for (Order order : orderList) {
	
			Nurse nurse = nurseDao.getNurseByID(order.getNurseID());
	%>
	<div class="orders">
            <div class="order-list">
                <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                <img class="order-ph" src="images/nurse/<%= nurse.getPicture() %>">
                <div class="order-id" style="display:inline-block;">
                    <p>������:&nbsp;&nbsp;<%= order.getOrderID() %></p>
                    <p>������&nbsp;<%= order.getUserName() %></p>
                    <p>��ַ��&nbsp;<%= order.getAddress() %></p>
                    <p>����Ҫ��&nbsp;<%= order.getRequire() %></p>
                </div>
                </a>
                <div class="order-a" style="color:#7d7d7d;">
                    <p>�������ڣ�<%= order.getOrderTime() %></p>
                 
               		<% if (order.getOrderState().equals("����ԤԼ")) { %>
                   <button class="btn btn-sm" data-toggle="modal" data-target="#agree" style="color:#f2f2f2;background-color:#23ac3a;">����ԤԼ</button>
					<% } %>
                    <div class="modal fade" id="agree" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">�Ƿ�ȷ�Ͻ���ԤԼ��&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseAgreeOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "��">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">��</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("����ԤԼ")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#cancel" style="color:#f2f2f2;background-color:#23ac3a;">�ܾ�ԤԼ</button>
			<% } %>
                    <div class="modal fade" id="cancel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">�Ƿ�ȷ�Ͼܾ�ԤԼ��&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseCancelOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "��">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">��</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("�����") || order.getOrderState().equals("ȡ��ԤԼ")) { %>
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
			            <form action = "NurseDeleteOrderServlet" method = "post" style="display:inline-block;">
							<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "��">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">��</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("��ԤԼ")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#accomplish" style="color:#f2f2f2;background-color:#23ac3a;">��ɶ���</button>
			 <% } %>
                    <div class="modal fade" id="accomplish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">�Ƿ�ȷ����ɶ�����&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseAccomplishOrderServlet" method = "post" style="display:inline-block;">
							<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "��">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">��</button>
                        
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