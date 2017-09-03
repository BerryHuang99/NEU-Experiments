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
<meta name="keywords" content="阿姨来了,阿姨,家政,保姆,钟点工,小时工,兼职,养老">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>个人中心 | 阿姨来了</title>

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
                <li><a href="browse.jsp?nurseKind=母婴护理">母婴护理</a></li>
                <li><a href="browse.jsp?nurseKind=婴儿护理">婴儿护理</a></li>
                <li><a href="browse.jsp?nurseKind=老人护理">老人护理</a></li>
                <li><a href="browse.jsp?nurseKind=日常家务">日常家务</a></li>
                <li><a href="browse.jsp?nurseKind=全能阿姨">全能阿姨</a></li>
                <li><a href="browse.jsp?nurseKind=钟点工">钟点工</a></li>
                <li><a href="browse.jsp?nurseKind=营养专家">营养专家</a></li>
            </menu>
            <div id="search">
                <form name="regform" action="serch.jsp" method="post">
                    <input id="text" type="text"  name="search" placeholder="搜索关键字">
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
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">我的订单&nbsp;</span></div>
        <div class="per-order">
            <ul>
                <li class=""><a class="" href="client.jsp">正在预约</a></li>
                <li><a class="" href="client_2.jsp">已预约</a></li>
                <li><a class="" href="client_3.jsp">已完成</a></li>
                <li class="o_current"><a class="o_current" href="client_4.jsp">所有订单</a></li>
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
                    <p>订单号:&nbsp;&nbsp;<%= order.getOrderID() %></p>
                    <p>姓名：&nbsp;<%= nurse.getNursename() %></p>
                    <p>类别：&nbsp;<%= nurse.getNursekind() %></p>
                    <p>订单状态：&nbsp;<%= order.getOrderState() %></p>
                </div>
                </a>
                <div class="order-a" style="color:#7d7d7d;">
                    <p>订单日期：<%= order.getOrderTime() %></p>
                    <% if (order.getOrderState().equals("正在预约") || order.getOrderState().equals("已预约")) { %>
                      <button class="btn btn-sm" data-toggle="modal" data-target="#cancel" style="color:#f2f2f2;background-color:#23ac3a;">取消预约</button>
               		<% } %>
                    <div class="modal fade" id="cancel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">是否确认取消预约？&nbsp;</span>
			                </div>
			           
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
			            <form action = "CancelOrderServlet" method = "post" style="display:inline-block;">
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
			            <form action = "DeleteOrderServlet" method = "post" style="display:inline-block;">
			            	<input type = "hidden" name = "orderID" value = "<%= order.getOrderID() %>">
                            <input type = "submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value = "是">
                        </form>
                            <button class="btn btn-sm" data-dismiss="modal" style="display:inline-block;color:#f2f2f2;background-color:#23ac3a;">否</button>
                        
                        </div>
                       
		            </div>
	            </div>
             </div>
             
             <% if (order.getOrderState().equals("已完成")) { %>
             <button class="btn btn-sm" data-toggle="modal" data-target="#evaluate" style="color:#f2f2f2;background-color:#23ac3a;">评论</button>
             <% } %>
			<div class="modal fade" id="evaluate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:200px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">评价&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
                            <form role="form" action="EvaluateServlet" method="post">
                                    <div style="margin:10px 0px;">
                                      	 好评<input type="radio" name="level" value="好评">
                                                                                                                         中评<input type="radio" name="level" value="中评">
                                       	 差评<input type="radio" name="level" value="差评">
                                    </div>
                                    <div class="form-group has-success" style="margin:10px 0px;">
                                        <span style="float:left;">评价内容：</span>
                                        <textarea class="form-control" name="content" rows="3"></textarea> 
                                    </div>
                                    <input type="hidden" name="nurseID" value="<%= nurse.getNurseID() %>">
                                    <input type="hidden" name="clientName" value="<%= name %>">
                                    <input type="hidden" name="url" value="client_4.jsp">
                                    <div style="margin:10px 0px;">
                                        <input type="submit" class="btn btn-sm" style="color:#f2f2f2;background-color:#23ac3a;" value="提交">
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