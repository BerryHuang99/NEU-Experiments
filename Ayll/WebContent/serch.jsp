<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page errorPage = "errorPage.jsp" %>
<%@ page import = "com.ayll.Vo.Nurse" %>
<%@ page import = "com.ayll.dao.UserDao" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta lang="zh-cmn-Hans">
<meta name="keywords" content="��������,����,����,��ķ,�ӵ㹤,Сʱ��,��ְ,����">
<meta name="viewport" content=""="width=device-width, initial-scale=1.0">
<link rel = "Shortcut Icon" href=images/favicon.ico>
<title>���� | ��������</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/starability-all.min.css"/>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
    <!--common state-->
    <%
    	if(request.getParameter("infor") != null)
    		request.setAttribute("seach", request.getParameter("infor"));
    %>
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
           		<jsp:param value="serch.jsp" name="url"/>
           		<jsp:param value="<%= request.getParameter(\"search\") %>" name="infor"/>
           	</jsp:include>
    </header>
    <div class="clearfix"></div>
    
   <%
     request.setCharacterEncoding("gb2312");
   %>
   <%
     if((request.getParameter("search") != null) || (request.getParameter("infor") != null)) {
   %>
    
	        <div class="main-body">
	        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">�������&nbsp;</span></div>

			<%
			   request.setCharacterEncoding("gb2312");
	           UserDao userdao = new UserDao();
	           ArrayList<Nurse> list = new ArrayList<Nurse>();
	           if(request.getParameter("infor") != null){
	           		list = userdao.Search(request.getParameter("infor"));
	           } else {
	        	    list = userdao.Search(request.getParameter("search"));
	           }
	           if(!list.isEmpty()) {
	           
	                for(Nurse nurse : list) {
	                
	        %>
	                          <div class="synopsis">
	                                <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
	                                    <div class="head"><img src= "images/nurse/<%= nurse.getPicture() %>"></div>
	                                    <div class="starability-container">
	                                        <form>
	                                            <fieldset class="starability-basic">
	                                            
	                                                <span style="padding:0px 10px;">�Ǽ���</span>
	                                     <% 
	                                    	int star = nurse.getStar();
	                                        for (int i = 5 ; i > 0; i--) {
	                                        			
	                                        if(i == star) {
	                                    %>
	                                        <input type="radio" id="rate<%= star %>-1" name="rating" value="<%= star %>" checked="checked" disabled />
	                                        <label for="rate<%= star %>-1"><%= star %> stars</label>
	                                        <% } else { %>
	                                        			
	                                        <input type="radio" id="rate<%= star %>-1" name="rating" value="<%= star %>"  disabled />
	                                        <label for="rate<%= star %>-1" title="����"><%= star %> stars</label>
	                                                	
	                                    <% 
	                                           }
	                                       }
	                                    %>
	                                            </fieldset>
	                                        </form>
	                                    </div>
	                                    <p><span>�������ͣ�</span><%= nurse.getNursekind() %><br>
	                                    <span>���������</span><%= nurse.getNurseArea() %><br>
	                                    <span>��飺</span><%= nurse.getInformation() %>
	                                    </p>
	                                </a>
	                                <a href="#" class="order"><img src="images/order.png"></a>
	                            </div>
	         <%
	                }
	           }      
	         %>
	    <div class="clearfix"></div>
   <%
     }
   %>                      
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