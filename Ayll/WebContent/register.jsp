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
<meta name="keywords" content="��������,����,����,��ķ,�ӵ㹤,Сʱ��,��ְ,����">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>�û�ע�� | ��������</title>

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
							
							msg.innerHTML = "<font color = 'red'>��ע��</font>";
						} else {
							
							msg.innerHTML = "<font color = 'green'>��ʹ��</font>";
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
				successLabelTip : "��֤�ɹ�"	
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
            <div id="in-up">
                <button class="btn btn-sm" data-toggle="modal" data-target="modal1">��¼</button>
                <button class="btn btn-sm" onclick="window.location='register.html';">ע��</button>
                
                <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:350px; margin:100px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">��¼&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#c1c1c1;">
                            <form>
                                <input type="text" id="" name="" placeholder="�û���/�ֻ���/����">
                                <input type="password" id="userPassword" name="userPassword" placeholder="����">
                                <div id="auth" style="padding:10px;">
                                    <input type="text" id="auth-code" name="auth-code" placeholder="��֤��">
                                    <span class="glyphicon glyphicon-refresh" style="color:#d2d2d2;font-size:15px;"></span>
                                    <img src="images/auth-code.png" style="width:90px; height:40px;">
                                </div>
                                <a href="#" style="float:right; font-size:10px; color:#c1c1c1;">��������?&nbsp;</a>
                                <input type="submit" id="in" value="��¼">
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
                �˻�ע��
            </div>
             <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-stack-1x">2</i>
                </span>
                ��д�û���Ϣ
            </div>
             <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-stack-1x">3</i>
                </span>
                ���Զ���
            </div>
             <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-check fa-stack-1x"></i>
                </span>
                ע��ɹ���
            </div>
        </div>

        <div class="rgs-body">
            <form action = "register_2.jsp" method = "post">
                <input id="userName" type="text" name="userTel" placeholder="ע���ֻ���/����" onblur="verify()">
                <span id = "msg"></span>
                <input id="userPassword" type="password" name="userPassword" placeholder="��������">
                <input id="userPassword" type="password" name="check" placeholder="ȷ������">
                <div id="slider">
                    <div id="slider_bg"></div>
                    <span id="label">>></span> <span id="labelTip">�϶�������֤</span> 
                </div>
                <input type = "submit" class="btn rgs-next" value = "��һ��">
            </form>
         </div>
    </div>

    <footer class="footer-b">
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