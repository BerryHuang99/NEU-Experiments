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
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="��������,����,����,��ķ,�ӵ㹤,Сʱ��,��ְ,����">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>�������� | ��������</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    </script>
</head>
<body>
    <!--common state-->
    <header>
        <div class="wrap">
            <a href="index.jsp"><img src="images/logo.png" alt="��������"></a>
            <div class="location">
                <a href="http://ditu.amap.com/" title="�鿴��ͼ" target="_blank"><img src="images/vector.gif"></a>
                <select>
                    <option value="beijing" selected="selected">����</option>
                    <option value="beijing" >�Ϻ�</option>
                    <option value="beijing" >���</option>
                    <option value="beijing" >�Ϻ�</option>
                </select>
            </div>
            <menu>
                <li><a href="#">ĸӤ����</a></li>
                <li><a href="#">Ӥ������</a></li>
                <li><a href="#">���˻���</a></li>
                <li><a href="#">�ճ�����</a></li>
                <li><a href="#">ȫ�ܰ���</a></li>
                <li><a href="#">�ӵ㹤</a></li>
                <li><a href="#">Ӫ��ר��</a></li>
            </menu>
            <div id="search">
                <form>
                    <input id="text" type="text"  name="search" placeholder="�����ؼ���">
                    <input id="search-buttom" type="button">
                </form>
            </div>
            <jsp:include page = "NurseInfo.jsp"/>
    </header>
    <div class="clearfix"></div>
	
	<%
		String nurseID = (String)session.getAttribute("AyllNurseID");
		NurseDao nurseDao = new NurseDao();
		
		Nurse nurse1 = nurseDao.getNurseByID(nurseID);
	%>
    <div class="per-title">
        <div class="per-ph img-circle">
            <img src="images/nurse/<%= nurse1.getPicture() %>" class="img-circle" style="width:100px; heigth:100px;background-color:#f2f2f2;border:3px #fff solid;">
            <a href="#" style="color:#f2f2f2;position:relative;bottom:20px;"><li class="fa fa-cog"></li></a>
        </div>
        <div class="per-info">
            <h2><%= nurse1.getNursename() %></h2>
            <p><span>���</span><%= nurse1.getNursekind() %></p>
            <p><span>ID��</span><%= nurse1.getNurseID() %></p>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">�ҵĶ���&nbsp;</span></div>
        <div class="per-order">
            <ul>
                <li><a class="" href="nurse.jsp">����Ԥ��</a></li>
                <li><a class="" href="nurse_2.jsp">������</a></li>
                <li class="o_current"><a class="o_current" href="nurse_3.jsp">���ж���</a></li>
            </ul>
        </div>
        <% 
			ArrayList<Order> orderList = nurseDao.getAllOrder(nurseID);
			for (Order order : orderList) {
	
			Nurse nurse = nurseDao.getNurseByID(order.getNurseID());
		%>
		<div class="orders">
            <div class="order-list">
                <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                <img class="order-ph" src="images/nurse/<%= nurse.getPicture() %>">
                <div class="order-id" style="display:inline-block;">
                    <p>������:&nbsp;&nbsp;<%= order.getOrderID() %> ״̬:&nbsp;&nbsp;<%= order.getOrderState() %></p>
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
    </div>
    <div class="clearfix"></div>

    <footer>
        <div class="about">
            <h5 style="font-weight:bold;">�������ǣ�</h5>
            <p>�鳤��½����</p>
            <p>��Ա������壬��һκ��֣�󲩣�����</p>
        </div>
        <div class="copy-right">
            <span style="font-size:20px;">&copy;</span> 2017 ��������, ������ѧ2015�����ѧԺ ���1507�� JavaWeb��Ʒ
        </div>
        <div class="contact">
            <h5 style="font-weight:bold;">��ϵ���ǣ�</h5>
            <a class="qq" href="#"><i class="fa fa-qq"><img class="qq-img" src="images/qq.png"></i></a>
            <a class="weixin" href="#"><i class="fa fa-weixin"><img class="weixin-img" src="images/weixin.png"></i></a>
            <a class="weibo" href="#"><i class="fa fa-weibo"><img class="weibo-img" src="images/weibo.png"></i></a>
            <a class="call" href="#"><i call class="fa fa-volume-control-phone"><div class="call-num">400-123-123</div></i></a>
        </div>
        
    </footer>
</body>
</html>