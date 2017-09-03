<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="阿姨来了,阿姨,家政,保姆,钟点工,小时工,兼职,养老">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>阿姨来了</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="css/lory.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/starability-all.min.css"/>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/lory.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/responsiveslides.min.js"></script>
   <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });

    'use strict';

        document.addEventListener('DOMContentLoaded', function () {
            var variableWidth    = document.querySelector('.js_variablewidth');

            lory(variableWidth, {
                rewind: true,
                enableMouseEvents: true
            });
        });
  </script>
</head>
<body>
	<%
		request.setCharacterEncoding("gb2312");
		response.setCharacterEncoding("gb2312"); 
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
           		<jsp:param value="index.jsp" name="url"/>
           </jsp:include>
    </header>
    <div class="clearfix"></div>

    <!-- carousel -->
    <div class=" header-right">
		<div class=" banner">
			 <div class="slider">
			    <div class="callbacks_container">
			      <ul class="rslides" id="slider">		       
					 <li>
			          	 <div class="banner1">
			          	</div>
			         </li>
					 <li>
			          	 <div class="banner2">
			          	 </div>
			         </li>
			         <li>
			          	 <div class="banner3">
			          	</div>
			         </li>		
			      </ul>
			  </div>
			</div>
		</div>
        <!-- list -->
        <div class="list center">
            <ul>
                <li><a href="#" style="background-color:#23ac3a;">全部阿姨</a></li>
                <li><a href="#">精致推荐</a></li>
                <li><a href="#">热门阿姨</a></li>
                <li><a href="#">养老知识</a></li>
                <li><a href="#">10年优惠</a></li>
                <li><a href="#">1日小时工</a></li>
                <li><a href="#">住家保姆</a></li>
            </ul>
        </div>
	</div>

    <div class="clearfix"></div>

    <!-- recommend -->
    <% 
    	
    %>
    <div class="main-body">
        <div class="recommend">
            <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">阿姨精选&nbsp;</span></div>
            <jsp:include page = "Recommend.jsp" />
        </div>

    <div class="promise">
        <div class="promise-left">
            <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">承诺雇主&nbsp;</span></div>
            <div>   
                <li class="fa fa-file-text fa-3x"></li>
                <div class="passage">
                    <p>提供规范的服务范本，半年内无限次换人，业内行情查询与阿姨工资管理。</p>
                </div>
            </div>

            <div>
                <li class="fa fa-lock fa-4x"></li>
                <div class="passage">
                    <p>帮助雇主进行解约续约，受理雇主投诉，进行纠纷调解，保护雇主隐私与权益。</p>
                </div>
            </div>

            <div>
                <li class="fa fa-eye fa-3x"></li>
                <div class="passage">
                    <p>支持管家、家政猎头等高端家政服务，为阿姨办理雇佣责任保险，提供详细背景调查资料。</p>
                </div>
            </div>
        </div>

        <div class="promise-right">
            <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">承诺阿姨&nbsp;</span></div>
            <div>   
                <li class="fa fa-bus fa-3x"></li>
                <div class="passage">
                    <p>首次报到车站迎接，提供正规工服，免费基础培训，3-7日安排上岗，初次上岗送至客户家。</p>
                </div>
            </div>

            <div>
                <li class="fa fa-address-card fa-3x"></li>
                <div class="passage">
                    <p>上户后一对一岗中辅导，提供意外及伤害保险，工作满半年优先加盟权，可参加各种家政评比。</p>
                </div>
            </div>

            <div>
                <li class="fa fa-heartbeat fa-3x"></li>
                <div class="passage">
                    <p>被客户微博、微信或信件公开表扬有奖励！表现突出可转为经纪人或培训老师。帮助解决家属困难。</p>
                </div>
            </div>
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