<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Nurse" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<%@ page import = "com.ayll.Vo.User" %>
<%@ page import = "com.ayll.Vo.Order" %>

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
                <li><a href="browse.jsp?nurseKind=ĸӤ����">ĸӤ����</a></li>
                <li><a href="browse.jsp?nurseKind=Ӥ������">Ӥ������</a></li>
                <li><a href="browse.jsp?nurseKind=���˻���">���˻���</a></li>
                <li><a href="browse.jsp?nurseKind=�ճ�����">�ճ�����</a></li>
                <li><a href="browse.jsp?nurseKind=ȫ�ܰ���">ȫ�ܰ���</a></li>
                <li><a href="browse.jsp?nurseKind=�ӵ㹤">�ӵ㹤</a></li>
                <li><a href="browse.jsp?nurseKind=Ӫ��ר��">Ӫ��ר��</a></li>
            </menu>
            <div id="search">
                <form name="regform" action="serch.jsp" method="post">
                    <input id="text" type="text"  name="search" placeholder="�����ؼ���">
                    <input id="search-buttom" type="submit" value="">
                </form>
            </div>
            <jsp:include page = "UserInfo.jsp">
           		<jsp:param value="index.jsp" name="url"/>
           </jsp:include>
    </header>
    <div class="clearfix"></div>

	<jsp:include page = "PersonalInfo.jsp" />
    <div class="clearfix"></div>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">�ҵĶ���&nbsp;</span></div>
        <div class="per-order">
            <ul>
                <li class=""><a class="" href="client.jsp">����ԤԼ</a></li>
                <li><a class="" href="client_2.jsp">��ԤԼ</a></li>
                <li><a class="" href="client_3.jsp">�����</a></li>
                <li class="o_current"><a class="o_current" href="client_4.jsp">���ж���</a></li>
            </ul>
        </div>
        <% 
        	UserDao userDao = new UserDao();
        	String name = (String)session.getAttribute("AyllLoginName");
        	ArrayList<Order> orderList = userDao.getAllOrder(name);
        	
        	
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
                      <button class="btn btn-sm" data-toggle="modal" data-target="#cancel" style="color:#f2f2f2;background-color:#23ac3a;">ȡ��ԤԼ</button>
               		<% } %>
                    <div class="modal fade" id="cancel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">�Ƿ�ȷ��ȡ��ԤԼ��&nbsp;</span>
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
                                    <input type="hidden" name="url" value="client_4.jsp">
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