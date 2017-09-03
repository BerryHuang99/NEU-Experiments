<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.User" %>
<jsp:useBean id = "user" class = "com.ayll.Vo.User" scope = "session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="阿姨来了,阿姨,家政,保姆,钟点工,小时工,兼职,养老">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>用户注册 | 阿姨来了</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/slide-unlock.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.12.1.min.js"></script> 
<script src="js/jquery.slideunlock.js"></script> 
<script type="text/javascript">
	function judge()
	{
		var judgeName = document.getElementByName("userTel");
		if (judgeName != ""){
			var req = getXMLHttpRequest();
		
			req.open("GET","checkUserServlet.jsp?name="+judgeName);
		
			req.onreadystatechange = function () {
				if(req.readyState == 4) {
				
					if (req.status == 200) {
						
						var msg = document.getElementById("msg");
						
						if (req.responseText == "true") {
							
							msg.innerHTML = "<font color = 'red'>已注册</font>";
						} else {
							
							msg.innerHTML = "<font color = 'green'>可使用</font>";
						}
					}		
				}
			}
			
			req.send(null);
		} else {
			document.getElementById("msg").innerHTML = "";
		}
	}

	function getXMLHttpRequest() {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}
	
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
            <div id="in-up">
                <button class="btn btn-sm" data-toggle="modal" data-target="modal1">登录</button>
                <button class="btn btn-sm" onclick="window.location='register.html';">注册</button>
                
                <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:100px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">登录&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
                            <form>
                                <input type="text" id="" name="" placeholder="用户名/手机号/邮箱">
                                <input type="password" id="userPassword" name="userPassword" placeholder="密码">
                                <div id="auth" style="padding:10px;">
                                    <input type="text" id="auth-code" name="auth-code" placeholder="验证码">
                                    <span class="glyphicon glyphicon-refresh" style="color:#d2d2d2;font-size:15px;"></span>
                                    <img src="images/auth-code.png" style="width:90px; height:40px;">
                                </div>
                                <a href="#" style="float:right; font-size:10px; color:#c1c1c1;">忘记密码?&nbsp;</a>
                                <input type="submit" id="in" value="登录">
                            </form>
                        </div>
		            </div>
	            </div>
             </div>

                <div >
            </div>
        </div>
    </header>

    <div class="register center">
        <div class="rgs-head">
            <div class="rgs-title rgs-current">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-spin fa-stack-2x"></i>
                    <i class="fa fa-stack-1x">1</i>
                </span>
                账户注册
            </div>
             <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-stack-1x">2</i>
                </span>
                填写用户信息
            </div>
             <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-stack-1x">3</i>
                </span>
                个性定制
            </div>
             <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-check fa-stack-1x"></i>
                </span>
                注册成功！
            </div>
        </div>

        <div class="rgs-body">
            <form action = "register_2.jsp" method = "post">
                <input id="userName" type="text" name="userTel" placeholder="注册手机号/邮箱" onblur="verify()">
                <span id = "msg"></span>
                <input id="userPassword" type="password" name="userPassword" placeholder="输入密码">
                <input id="userPassword" type="password" name="check" placeholder="确认密码">
                <div id="slider">
                    <div id="slider_bg"></div>
                    <span id="label">>></span> <span id="labelTip">拖动滑块验证</span> 
                </div>
                <input type = "submit" class="btn rgs-next" value = "下一步">
            </form>
         </div>
    </div>

    <footer class="footer-b">
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