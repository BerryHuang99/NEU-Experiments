<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="°¢ÒÌÀ´ÁË,°¢ÒÌ,¼ÒÕþ,±£Ä·,ÖÓµã¹¤,Ð¡Ê±¹¤,¼æÖ°,ÑøÀÏ">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>°¢ÒÌµÇÂ¼ | °¢ÒÌÀ´ÁË</title>

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
				successLabelTip : "ÑéÖ¤³É¹¦"	
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
            <a href="index.jsp"><img src="images/logo.png" alt="°¢ÒÌÀ´ÁË"></a>
            <div class="location">
                <a href="http://ditu.amap.com/" title="²é¿´µØÍ¼" target="_blank"><img src="images/vector.gif"></a>
                <select>
                    <option value="beijing" selected="selected">ÉòÑô</option>
                    <option value="beijing" >ÉÏº£</option>
                    <option value="beijing" >Ìì½ò</option>
                    <option value="beijing" >ÉÏº£</option>
                </select>
            </div>
            <menu>
                <li><a href="#">Ä¸Ó¤»¤Àí</a></li>
                <li><a href="#">Ó¤¶ù»¤Àí</a></li>
                <li><a href="#">ÀÏÈË»¤Àí</a></li>
                <li><a href="#">ÈÕ³£¼ÒÎñ</a></li>
                <li><a href="#">È«ÄÜ°¢ÒÌ</a></li>
                <li><a href="#">ÖÓµã¹¤</a></li>
                <li><a href="#">ÓªÑø×¨¼Ò</a></li>
            </menu>
            <div id="search">
                <form>
                    <input id="text" type="text"  name="search" placeholder="ËÑË÷¹Ø¼ü×Ö">
                    <input id="search-buttom" type="button">
                </form>
            </div>

                <div >
            </div>
        </div>
    </header>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">°¢ÒÌµÇÂ¼&nbsp;</span></div>
        <div class="register center">
            

            <div class="rgs-body">
                <form action = "NurseLoginServlet" method = "post">
                    <input id="userName" type="text" name="nurseName" placeholder="°¢ÒÌID">
                    <input id="userPassword" type="password" name="nursePassword" placeholder="ÊäÈëÃÜÂë">
                    <% if(message != null) { %>
                    	<p><span style = "color:red; font-size:13px;" id = "td2">
						<%=message %>
						</span>
						</p>
					<% } %>
                    <div id="slider">
                        <div id="slider_bg"></div>
                        <span id="label">>></span> <span id="labelTip">ÍÏ¶¯»¬¿éÑéÖ¤</span> 
                    </div>
                    <input type = "submit" class="btn rgs-next" value = "µÇÂ½">
                </form>
            </div>
        </div>
    </div>

    <footer>
        <div class="about">
            <h5 style="font-weight:bold;">¹ØÓÚÎÒÃÇ£º</h5>
            <p>×é³¤£ºÂ½Îý¼Ñ</p>
            <p>×éÔ±£º»ÆÓñ·å£¬ËÕÒ»Îº£¬Ö£Åó²©£¬½¯»Ô</p>
        </div>
        <div class="copy-right">
            <span style="font-size:20px;">&copy;</span> 2017 °¢ÒÌÀ´ÁË, ¶«±±´óÑ§2015¼¶Èí¼þÑ§Ôº Èí¼þ1507°à JavaWeb×÷Æ·
        </div>
        <div class="contact">
            <h5 style="font-weight:bold;">ÁªÏµÎÒÃÇ£º</h5>
            <a class="qq" href="#"><i class="fa fa-qq"><img class="qq-img" src="images/qq.png"></i></a>
            <a class="weixin" href="#"><i class="fa fa-weixin"><img class="weixin-img" src="images/weixin.png"></i></a>
            <a class="weibo" href="#"><i class="fa fa-weibo"><img class="weibo-img" src="images/weibo.png"></i></a>
            <a class="call" href="#"><i call class="fa fa-volume-control-phone"><div class="call-num">400-123-123</div></i></a>
        </div>
        
    </footer>
</body>
</html>