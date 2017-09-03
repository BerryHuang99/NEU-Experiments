<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Order" %>
<%@ page import = "com.ayll.dao.NurseDao" %>
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
		
		Nurse nurse = nurseDao.getNurseByID(nurseID);
	%>
    <div class="per-title">
        <div class="per-ph img-circle">
            <img src="images/nurse/<%= nurse.getPicture() %>" class="img-circle" style="width:100px; heigth:100px;background-color:#f2f2f2;border:3px #fff solid;">
            <a href="#" style="color:#f2f2f2;position:relative;bottom:20px;"><li class="fa fa-cog"></li></a>
        </div>
        <div class="per-info">
            <h2><%= nurse.getNursename() %></h2>
            <p><span>���</span><%= nurse.getNursekind() %></p>
            <p><span>ID��</span><%= nurse.getNurseID() %></p>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">�ҵĶ���&nbsp;</span></div>
        <div class="per-order">
            <ul>
                <li><a class="" href="nurse.jsp">����ԤԼ</a></li>
                <li class="o_current"><a class="o_current" href="nurse_2.jsp">������</a></li>
                <li><a class="" href="nurse_3.jsp">���ж���</a></li>
            </ul>
        </div>
        <jsp:include page = "nurseOrder.jsp">
        	<jsp:param value="��ԤԼ" name="state"/>
        </jsp:include>
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