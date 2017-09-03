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
<meta name="keywords" content="阿姨来了,阿姨,家政,保姆,钟点工,小时工,兼职,养老">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>阿姨中心 | 阿姨来了</title>

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
            <a href="index.jsp"><img src="images/logo.png" alt="阿姨来了"></a>
            <div class="location">
                <a href="http://ditu.amap.com/" title="查看地图" target="_blank"><img src="images/vector.gif"></a>
                <select>
                    <option value="beijing" selected="selected">沈阳</option>
                    <option value="beijing" >上海</option>
                    <option value="beijing" >天津</option>
                    <option value="beijing" >上海</option>
                </select>
            </div>
            <menu>
                <li><a href="#">母婴护理</a></li>
                <li><a href="#">婴儿护理</a></li>
                <li><a href="#">老人护理</a></li>
                <li><a href="#">日常家务</a></li>
                <li><a href="#">全能阿姨</a></li>
                <li><a href="#">钟点工</a></li>
                <li><a href="#">营养专家</a></li>
            </menu>
            <div id="search">
                <form>
                    <input id="text" type="text"  name="search" placeholder="搜索关键字">
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
            <p><span>类别：</span><%= nurse1.getNursekind() %></p>
            <p><span>ID：</span><%= nurse1.getNurseID() %></p>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">我的订单&nbsp;</span></div>
        <div class="per-order">
            <ul>
                <li><a class="" href="nurse.jsp">接受预定</a></li>
                <li><a class="" href="nurse_2.jsp">服务中</a></li>
                <li class="o_current"><a class="o_current" href="nurse_3.jsp">所有订单</a></li>
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
                    <p>订单号:&nbsp;&nbsp;<%= order.getOrderID() %> 状态:&nbsp;&nbsp;<%= order.getOrderState() %></p>
                    <p>雇主：&nbsp;<%= order.getUserName() %></p>
                    <p>地址：&nbsp;<%= order.getAddress() %></p>
                    <p>服务要求：&nbsp;<%= order.getRequire() %></p>

                </div>
                </a>
                <div class="order-a" style="color:#7d7d7d;">
                    <p>订单日期：<%= order.getOrderTime() %></p>
                 
               		<% if (order.getOrderState().equals("正在预约")) { %>
                   <button class="btn btn-sm" data-toggle="modal" data-target="#agree" style="color:#f2f2f2;background-color:#23ac3a;">接受预约</button>
					<% } %>
                    <div class="modal fade" id="agree" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">是否确认接受预约？&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseAgreeOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "是">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">否</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("正在预约")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#cancel" style="color:#f2f2f2;background-color:#23ac3a;">取消订单</button>
			<% } %>
                    <div class="modal fade" id="cancel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">是否确认取消订单？&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseCancelOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "是">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">否</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("已完成") || order.getOrderState().equals("取消预约")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#delete" style="color:#f2f2f2;background-color:#23ac3a;">删除订单</button>
			 <% } %>
                    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">是否确认删除订单？&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseDeleteOrderServlet" method = "post" style="display:inline-block;">
							<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "是">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">否</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("已预约")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#accomplish" style="color:#f2f2f2;background-color:#23ac3a;">完成订单</button>
			 <% } %>
                    <div class="modal fade" id="accomplish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">是否确认完成订单？&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "NurseAccomplishOrderServlet" method = "post" style="display:inline-block;">
							<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "是">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">否</button>
                        
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
            <h5 style="font-weight:bold;">关于我们：</h5>
            <p>组长：陆锡佳</p>
            <p>组员：黄玉峰，苏一魏，郑朋博，蒋辉</p>
        </div>
        <div class="copy-right">
            <span style="font-size:20px;">&copy;</span> 2017 阿姨来了, 东北大学2015级软件学院 软件1507班 JavaWeb作品
        </div>
        <div class="contact">
            <h5 style="font-weight:bold;">联系我们：</h5>
            <a class="qq" href="#"><i class="fa fa-qq"><img class="qq-img" src="images/qq.png"></i></a>
            <a class="weixin" href="#"><i class="fa fa-weixin"><img class="weixin-img" src="images/weixin.png"></i></a>
            <a class="weibo" href="#"><i class="fa fa-weibo"><img class="weibo-img" src="images/weibo.png"></i></a>
            <a class="call" href="#"><i call class="fa fa-volume-control-phone"><div class="call-num">400-123-123</div></i></a>
        </div>
        
    </footer>
</body>
</html>