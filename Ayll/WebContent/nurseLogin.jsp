<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="阿姨来了,阿姨,家政,保姆,钟点工,小时工,兼职,养老">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>阿姨登录 | 阿姨来了</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/slide-unlock.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.12.1.min.js"></script> 
<script src="js/jquery.slideunlock.js"></script> 
<script>
    $(function () {
        var slider = new SliderUnlock("#slider",{
				successLabelTip : "验证成功"	
			},function(){
        	});
        slider.init();
    })
</script>
</head>
<body>
    <!--common state-->
    <% String message = (String)(request.getAttribute("message")); %>
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

                <div >
            </div>
        </div>
    </header>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">阿姨登录&nbsp;</span></div>
        <div class="register center">
            

            <div class="rgs-body">
                <form action = "NurseLoginServlet" method = "post">
                    <input id="userName" type="text" name="nurseName" placeholder="阿姨ID">
                    <input id="userPassword" type="password" name="nursePassword" placeholder="输入密码">
                    <% if(message != null) { %>
                    	<p><span style = "color:red; font-size:13px;" id = "td2">
						<%=message %>
						</span>
						</p>
					<% } %>
                    <div id="slider">
                        <div id="slider_bg"></div>
                        <span id="label">>></span> <span id="labelTip">拖动滑块验证</span> 
                    </div>
                    <input type = "submit" class="btn rgs-next" value = "登陆">
                </form>
            </div>
        </div>
    </div>

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