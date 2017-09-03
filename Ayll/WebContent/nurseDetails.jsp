<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "com.ayll.Vo.Nurse" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="阿姨来了,阿姨,家政,保姆,钟点工,小时工,兼职,养老">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>阿姨 | 阿姨来了</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/starability-all.min.css"/>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function clickAlert(){
		var string = "收藏成功";
		alert(string);
	}
</script>
</head>
<body>
	<%
		UserDao userDao = new UserDao();
		Nurse nurse = new Nurse();
		if(request.getParameter("nurseID") != null)
			nurse = userDao.getNurseByID(request.getParameter("nurseID"));
		else
			nurse = userDao.getNurseByID(request.getParameter("infor"));
		String userName = (String)session.getAttribute("AyllLoginName");
		
	%>
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
           		<jsp:param value="nurseDetails.jsp" name="url"/>
           		<jsp:param value="<%= request.getParameter(\"nurseID\") %>" name="infor"/>
           	</jsp:include>
    </header>
    <div class="clearfix"></div>
	
    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">阿姨简介&nbsp;</span></div>
        
        <div class="card-left">
            <div class="ayi-pho"><img src="images/nurse/<%= nurse.getPicture() %>"></div>
            <div class="mini-card">
                <div class="starability-container">
                    <form>
                        <fieldset class="starability-basic">
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
                
                <div class="analysis">
                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">服务：</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getService() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getService() %>%</span>
                    </div>

                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">态度：</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getAttitude() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getAttitude() %>%</span>
                    </div>

                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">知识：</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getKnowledge() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getKnowledge() %>%</span>
                    </div>

                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">信息：</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getComplete() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getComplete() %>%</span>
                    </div>
                </div>
            </div>
        </div>

        <img class="card-ti" src="images/circles.png">

        <div class="card-right">
            <div style="float:right;color:#7d7d7d;"> ID:<%= nurse.getNurseID() %></div>
            <div class="clearfix"></div>
            <div>
                <p><span><i class="fa fa-user-circle " style="color:#23ac3a;"></i>&nbsp;姓名：&nbsp;&nbsp;&nbsp;</span><%= nurse.getNursename() %></p>
                <p><span><i class="fa fa-address-card-o " style="color:#23ac3a;"></i>&nbsp;年龄：&nbsp;&nbsp;&nbsp;</span><%= nurse.getNurseage() %></p>
                <p><span><i class="fa fa-group " style="color:#23ac3a;"></i>&nbsp;类别：&nbsp;&nbsp;&nbsp;</span><%= nurse.getNursekind() %></p>
                <p><span><i class="fa fa-graduation-cap " style="color:#23ac3a;"></i>&nbsp;学历：&nbsp;&nbsp;&nbsp;</span><%= nurse.getNurseedu() %></p>
                <p><span><i class="fa fa-globe " style="color:#23ac3a;"></i>&nbsp;地区：&nbsp;&nbsp;&nbsp;</span><%= nurse.getNurseArea() %></p>
                <p><span><i class="fa fa-address-card " style="color:#23ac3a;"></i>&nbsp;工作年限：&nbsp;</span><%= nurse.getNurseyear() %></p>
                <p><span><i class="fa fa-yen " style="color:#23ac3a;"></i>&nbsp;佣金：&nbsp;&nbsp;&nbsp;</span><%= nurse.getReward() %></p>
                <p><span><i class="fa fa-clock-o " style="color:#23ac3a;"></i>&nbsp;预约状态：&nbsp;</span>
                <% if(nurse.isIsbook() == false) { %>
                	空闲
                <% } else  { %>
                	已有预约
                <% } %>
                </p>
                <p><span><i class="fa fa-commenting-o" style="color:#23ac3a;"></i>&nbsp;个人简介：&nbsp;</span><%= nurse.getInformation() %></p>
            </div>
            <% if(nurse.isIsbook() == false) { %>
            	<% if(userName != null) { %>
            <button class="btn n-order" data-toggle="modal" data-target="#m-order"><i class="glyphicon glyphicon-edit"></i> 预约</button>
            	<% } else { %>
            	<button class="btn n-order" data-toggle="modal" data-target="#modal1">预约</button>
            	<% } %>
            <% } else  { %>
            <button class="btn n-order" data-toggle="modal" data-target="#m-order" disabled = "disabled"><i class="glyphicon glyphicon-edit"></i> 预约</button>
            <% } %>
            
            <% if(userName != null) { %>
            <form action = "UserCollectionServlet" method = "post" style = "display:inline-block;">
            	<input type = "hidden" name = "url" value = "nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
            	<input type = "hidden" name = "nurseID" value = "<%= nurse.getNurseID() %>">
            	<input type = "hidden" name = "userName" value = "<%= userName %>">
            	<input type = "submit" class="btn n-order" value = "加入收藏" onClick="clickAlert()"></input>
            </form>
            <% } else { %>
            <button class="btn n-order" data-toggle="modal" data-target="#modal1"><i class="fa fa-star"></i> 加入收藏</button>
            <% } %>
            <button class="btn n-order"><i class="fa fa-share-alt"></i></button>

            <div class="modal fade" id="m-order" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:400px; margin:40px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">预定&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#727272;">
                            <div  class="order-card center">  
                                <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                                    <img class="order-right img-rounded" style="width:100px; height:100px;" src="images/nurse/<%= nurse.getPicture() %>">
                                    <div class="order-left">
                                        <p>ID:&nbsp;<%= nurse.getNurseID() %></p>
                                        <p>姓名：&nbsp;<%= nurse.getNursename() %></p>
                                        <p>佣金：&nbsp;<%= nurse.getReward() %></p>
                                    </div>
                
                                </a>
                            </div>
                            <form role="form" style="width:350px; margin:0px auto;" action = "UserIndentServlet" method = "post">
                                <div class="form-group has-success">
                                    <label >服务地址：</label>
                                    <textarea class="form-control" rows="3" name = "address"></textarea>
                                </div>
                                <div class="form-group has-success">
                                    <label >服务要求：</label>
                                    <textarea class="form-control" rows="3" name = "require"></textarea>
                                </div>
                                <label for="pay">支付方式：</label>
                                		支付宝：<input type="radio" name="pay" value ="支付宝"checked="checked">
                                		银联：<input type="radio" name="pay" value ="银联">
                                <input type = "hidden" name = "userName" value = "<%= userName %>">
                                <input type = "hidden" name = "nurseID" value = "<%= nurse.getNurseID() %>">
                                <input type = "hidden" name = "url" value = "nurseDetails?nurseID=<%= nurse.getNurseID() %>">
                                <input class="btn rgs-next" type = "submit" value = "预约">
                            </form>
                        </div>
		            </div>
	            </div>
             </div>
        </div>
        
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">用户评价&nbsp;</span></div>
        <div class="evaluate">

      		<jsp:include page="evaluate.jsp">
      			<jsp:param value="<%= nurse.getNurseID() %>" name="nurseID"/>
      		</jsp:include>
        </div>
        
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