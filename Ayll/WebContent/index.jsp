<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="��������,����,����,��ķ,�ӵ㹤,Сʱ��,��ְ,����">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>��������</title>

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
                <li><a href="#" style="background-color:#23ac3a;">ȫ������</a></li>
                <li><a href="#">�����Ƽ�</a></li>
                <li><a href="#">���Ű���</a></li>
                <li><a href="#">����֪ʶ</a></li>
                <li><a href="#">10���Ż�</a></li>
                <li><a href="#">1��Сʱ��</a></li>
                <li><a href="#">ס�ұ�ķ</a></li>
            </ul>
        </div>
	</div>

    <div class="clearfix"></div>

    <!-- recommend -->
    <% 
    	
    %>
    <div class="main-body">
        <div class="recommend">
            <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">���̾�ѡ&nbsp;</span></div>
            <jsp:include page = "Recommend.jsp" />
        </div>

    <div class="promise">
        <div class="promise-left">
            <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">��ŵ����&nbsp;</span></div>
            <div>   
                <li class="fa fa-file-text fa-3x"></li>
                <div class="passage">
                    <p>�ṩ�淶�ķ��񷶱������������޴λ��ˣ�ҵ�������ѯ�밢�̹��ʹ���</p>
                </div>
            </div>

            <div>
                <li class="fa fa-lock fa-4x"></li>
                <div class="passage">
                    <p>�����������н�Լ��Լ���������Ͷ�ߣ����о��׵��⣬����������˽��Ȩ�档</p>
                </div>
            </div>

            <div>
                <li class="fa fa-eye fa-3x"></li>
                <div class="passage">
                    <p>֧�ֹܼҡ�������ͷ�ȸ߶˼�������Ϊ���̰����Ӷ���α��գ��ṩ��ϸ�����������ϡ�</p>
                </div>
            </div>
        </div>

        <div class="promise-right">
            <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">��ŵ����&nbsp;</span></div>
            <div>   
                <li class="fa fa-bus fa-3x"></li>
                <div class="passage">
                    <p>�״α�����վӭ�ӣ��ṩ���湤������ѻ�����ѵ��3-7�հ����ϸڣ������ϸ������ͻ��ҡ�</p>
                </div>
            </div>

            <div>
                <li class="fa fa-address-card fa-3x"></li>
                <div class="passage">
                    <p>�ϻ���һ��һ���и������ṩ���⼰�˺����գ��������������ȼ���Ȩ���ɲμӸ��ּ������ȡ�</p>
                </div>
            </div>

            <div>
                <li class="fa fa-heartbeat fa-3x"></li>
                <div class="passage">
                    <p>���ͻ�΢����΢�Ż��ż����������н���������ͻ����תΪ�����˻���ѵ��ʦ����������������ѡ�</p>
                </div>
            </div>
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