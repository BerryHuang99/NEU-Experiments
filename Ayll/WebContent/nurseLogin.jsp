<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="��������,����,����,��ķ,�ӵ㹤,Сʱ��,��ְ,����">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>���̵�¼ | ��������</title>

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
				successLabelTip : "��֤�ɹ�"	
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

                <div >
            </div>
        </div>
    </header>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">���̵�¼&nbsp;</span></div>
        <div class="register center">
            

            <div class="rgs-body">
                <form action = "NurseLoginServlet" method = "post">
                    <input id="userName" type="text" name="nurseName" placeholder="����ID">
                    <input id="userPassword" type="password" name="nursePassword" placeholder="��������">
                    <% if(message != null) { %>
                    	<p><span style = "color:red; font-size:13px;" id = "td2">
						<%=message %>
						</span>
						</p>
					<% } %>
                    <div id="slider">
                        <div id="slider_bg"></div>
                        <span id="label">>></span> <span id="labelTip">�϶�������֤</span> 
                    </div>
                    <input type = "submit" class="btn rgs-next" value = "��½">
                </form>
            </div>
        </div>
    </div>

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