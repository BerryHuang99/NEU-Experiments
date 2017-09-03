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
<title>�û�ע�� | ��������</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/amazeui.min.css">
<link rel="stylesheet" href="css/amazeui.cropper.css">
<link rel="stylesheet" href="css/custom_up_img.css">
<style type="text/css">
    .up-img-cover {width: 100px;height: 100px;}
    .up-img-cover img{width: 100%;}
    .up-img-txt label{font-weight: 100;margin-top: 50px;}
</style>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/amazeui.min.js" charset="utf-8"></script>
<script src="js/cropper.min.js" charset="utf-8"></script>
<script src="js/custom_up_img.js" charset="utf-8"></script>
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
                <button class="btn btn-sm" data-toggle="modal" data-target="#modal1">��¼</button>
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
                                <input type="text" id="userName" name="userName" placeholder="�û���/�ֻ���/����">
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
    <div class="clearfix"></div>

    <div class="register center">
        <div class="rgs-head">
            <div class="rgs-title">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-stack-2x"></i>
                    <i class="fa fa-stack-1x">1</i>
                </span>
                �˻�ע��
            </div>
             <div class="rgs-title rgs-current">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-circle-o-notch fa-spin fa-stack-2x"></i>
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

        <div class="rgs-body" style="margin:40px auto 70px;">
            <div class="up-img-cover hs"  id="up-img-touch" >
    		    <img class="head-pho" alt="���ͼƬ�ϴ�" src="images/user/default.jpg" data-am-popover="{content: '����ϴ�ͷ��', trigger: 'hover focus'}" >
    	    </div>
    	
    	<!--ͼƬ�ϴ���-->
    	<div class="am-modal am-modal-no-btn up-modal-frame" tabindex="-1" id="up-modal-frame">
		  <div class="am-modal-dialog up-frame-parent up-frame-radius">
		    <div class="am-modal-hd up-frame-header">
		       <label>�޸�ͷ��</label>
		      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    </div>
		    <div class="am-modal-bd  up-frame-body">
		      <div class="am-g am-fl">
		      	
		      	<div class="am-form-group am-form-file">
			      <div class="am-fl">
			        <button type="button" class="am-btn am-btn-default am-btn-sm">
			          <i class="am-icon-cloud-upload"></i> ѡ��Ҫ�ϴ����ļ�</button>
			      </div>
			      <input type="file" class="up-img-file">
			   	</div>
		      </div>
		      <div class="am-g am-fl">
		      	<div class="up-pre-before up-frame-radius">
		      		<img alt="" src="" class="up-img-show" id="up-img-show" >
		      	</div>
		      	<div class="up-pre-after up-frame-radius">
		      	</div>
		      </div>
		      <div class="am-g am-fl">
   				<div class="up-control-btns" style="width:200px;">
    				<span class="am-icon-rotate-left"   id="up-btn-left"></span>
    				<span class="am-icon-rotate-right"  id="up-btn-right"></span>
    				<span class="am-icon-check up-btn-ok" url="/admin/user/upload.action"
    					parameter="{width:'100',height:'100'}">
    				</span>
   				</div>
	    	  </div>
		      
		    </div>
		  </div>
		</div>
    	
    	<!--���ؿ�-->
    	<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="up-modal-loading">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">�����ϴ�...</div>
		    <div class="am-modal-bd">
		      <span class="am-icon-spinner am-icon-spin"></span>
		    </div>
		  </div>
		</div>
		
		<!--�����-->
		<div class="am-modal am-modal-alert" tabindex="-1" id="up-modal-alert">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">��Ϣ</div>
		    <div class="am-modal-bd"  id="alert_content">
		              �ɹ���
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn">ȷ��</span>
		    </div>
		  </div>
		</div>
            
            <form action = "UserRegisterServlet" method = "post">
              <div style="float: left;margin:0px 0px 20px 0px;"> <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ͷ��</label></div>
               <div class="clearfix"></div>
                <label for="name"><span style="color:red;">*</span>�ǳ�:</label><input type="text" id="name" name = "userName">&nbsp;&nbsp;&nbsp;

                <div style="padding:10px 0px;">
                    <label for="sex"><i class="fa fa-venus-mars"></i>�Ա�&nbsp;&nbsp;</label>
                    <i class="fa fa-venus"></i>��
                    <input id="sex" type="radio" checked="checked" name="userSex" value="��" checked = "checked">
                    &nbsp;&nbsp;
                    <i class="fa fa-mars"></i>Ů
                    <input id="sex" type="radio"  name="userSex" value="Ů">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <input type = "hidden" name = "userTel" value="<%= request.getParameter("userTel") %>"/>
                <input type = "hidden" name = "userPassword" value="<%= request.getParameter("userPassword") %>"/>
                <input type = "submit" class="btn rgs-next" value = "��һ��"/>
            </form>

            
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