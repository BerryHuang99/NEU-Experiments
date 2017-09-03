<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%@ page import = "com.ayll.Vo.Nurse" %>
<%@ page import = "com.ayll.dao.UserDao" %>
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
<script type="text/javascript">
	function clickAlert(){
		var string = "�ղسɹ�";
		alert(string);
	}
</script>
</head>
<body>
	<%
		UserDao userDao = new UserDao();
		Nurse nurse = new Nurse();
		if(request.getParameter("nurseID") != null)
			nurse = userDao.getNurseByID(request.getParameter("nurseID"));
		else
			nurse = userDao.getNurseByID(request.getParameter("infor"));
		String userName = (String)session.getAttribute("AyllLoginName");
		
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
           		<jsp:param value="nurseDetails.jsp" name="url"/>
           		<jsp:param value="<%= request.getParameter(\"nurseID\") %>" name="infor"/>
           	</jsp:include>
    </header>
    <div class="clearfix"></div>
	
    <div class="main-body">
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">���̼��&nbsp;</span></div>
        
        <div class="card-left">
            <div class="ayi-pho"><img src="images/nurse/<%= nurse.getPicture() %>"></div>
            <div class="mini-card">
                <div class="starability-container">
                    <form>
                        <fieldset class="starability-basic">
                            <% 
                            	int star = nurse.getStar();
                                    	
                                for (int i = 5; i > 0; i--) {
                                        			
                                if(i == star) {
                            %>
                                    	
                            <input type="radio" id="rate<%= star %>-1" name="rating" value="<%= star %>" checked="checked" disabled />
                            <label for="rate<%= star %>-1"><%= star %> stars</label>
                                        
                           	<% } else { %>
                                        			
                            <input type="radio" id="rate<%= star %>-1" name="rating" value="<%= star %>" disabled />
                            <label for="rate<%= star %>-1"><%= star %> stars</label>
                                                	
                            <% 
                                    }
                            	}
                            %>
                        </fieldset>
                    </form>
                </div>
                
                <div class="analysis">
                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">����</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getService() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getService() %>%</span>
                    </div>

                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">̬�ȣ�</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getAttitude() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getAttitude() %>%</span>
                    </div>

                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">֪ʶ��</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getKnowledge() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getKnowledge() %>%</span>
                    </div>

                    <div style="height:25px;">
                    <span style="position:relative; bottom:10px;">��Ϣ��</span>
                    <div class="progress" style="width:90px; height:10px; margin:10px 0px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemax="100" 
                            aria-valuemin="0" style="width:<%= nurse.getComplete() %>%; background-color:#23ac3a;">
                        </div>
                    </div>
                    <span style="position:relative; bottom:10px;"><%= nurse.getComplete() %>%</span>
                    </div>
                </div>
            </div>
        </div>

        <img class="card-ti" src="images/circles.png">

        <div class="card-right">
            <div style="float:right;color:#7d7d7d;"> ID:<%= nurse.getNurseID() %></div>
            <div class="clearfix"></div>
            <div>
                <p><span><i class="fa fa-user-circle " style="color:#23ac3a;"></i>&nbsp;������&nbsp;&nbsp;&nbsp;</span><%= nurse.getNursename() %></p>
                <p><span><i class="fa fa-address-card-o " style="color:#23ac3a;"></i>&nbsp;���䣺&nbsp;&nbsp;&nbsp;</span><%= nurse.getNurseage() %></p>
                <p><span><i class="fa fa-group " style="color:#23ac3a;"></i>&nbsp;���&nbsp;&nbsp;&nbsp;</span><%= nurse.getNursekind() %></p>
                <p><span><i class="fa fa-graduation-cap " style="color:#23ac3a;"></i>&nbsp;ѧ����&nbsp;&nbsp;&nbsp;</span><%= nurse.getNurseedu() %></p>
                <p><span><i class="fa fa-globe " style="color:#23ac3a;"></i>&nbsp;������&nbsp;&nbsp;&nbsp;</span><%= nurse.getNurseArea() %></p>
                <p><span><i class="fa fa-address-card " style="color:#23ac3a;"></i>&nbsp;�������ޣ�&nbsp;</span><%= nurse.getNurseyear() %></p>
                <p><span><i class="fa fa-yen " style="color:#23ac3a;"></i>&nbsp;Ӷ��&nbsp;&nbsp;&nbsp;</span><%= nurse.getReward() %></p>
                <p><span><i class="fa fa-clock-o " style="color:#23ac3a;"></i>&nbsp;ԤԼ״̬��&nbsp;</span>
                <% if(nurse.isIsbook() == false) { %>
                	����
                <% } else  { %>
                	����ԤԼ
                <% } %>
                </p>
                <p><span><i class="fa fa-commenting-o" style="color:#23ac3a;"></i>&nbsp;���˼�飺&nbsp;</span><%= nurse.getInformation() %></p>
            </div>
            <% if(nurse.isIsbook() == false) { %>
            	<% if(userName != null) { %>
            <button class="btn n-order" data-toggle="modal" data-target="#m-order"><i class="glyphicon glyphicon-edit"></i> ԤԼ</button>
            	<% } else { %>
            	<button class="btn n-order" data-toggle="modal" data-target="#modal1">ԤԼ</button>
            	<% } %>
            <% } else  { %>
            <button class="btn n-order" data-toggle="modal" data-target="#m-order" disabled = "disabled"><i class="glyphicon glyphicon-edit"></i> ԤԼ</button>
            <% } %>
            
            <% if(userName != null) { %>
            <form action = "UserCollectionServlet" method = "post" style = "display:inline-block;">
            	<input type = "hidden" name = "url" value = "nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
            	<input type = "hidden" name = "nurseID" value = "<%= nurse.getNurseID() %>">
            	<input type = "hidden" name = "userName" value = "<%= userName %>">
            	<input type = "submit" class="btn n-order" value = "�����ղ�" onClick="clickAlert()"></input>
            </form>
            <% } else { %>
            <button class="btn n-order" data-toggle="modal" data-target="#modal1"><i class="fa fa-star"></i> �����ղ�</button>
            <% } %>
            <button class="btn n-order"><i class="fa fa-share-alt"></i></button>

            <div class="modal fade" id="m-order" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog" style="width:400px; margin:40px auto;">
		                <div class="modal-content"  style="font-family: "Microsoft YaHei"">
			                <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <span class="modal-title" id="myModalLabel">Ԥ��&nbsp;</span>
			                </div>
			            <div class="modal-body" style="text-align:center; color:#727272;">
                            <div  class="order-card center">  
                                <a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                                    <img class="order-right img-rounded" style="width:100px; height:100px;" src="images/nurse/<%= nurse.getPicture() %>">
                                    <div class="order-left">
                                        <p>ID:&nbsp;<%= nurse.getNurseID() %></p>
                                        <p>������&nbsp;<%= nurse.getNursename() %></p>
                                        <p>Ӷ��&nbsp;<%= nurse.getReward() %></p>
                                    </div>
                
                                </a>
                            </div>
                            <form role="form" style="width:350px; margin:0px auto;" action = "UserIndentServlet" method = "post">
                                <div class="form-group has-success">
                                    <label >�����ַ��</label>
                                    <textarea class="form-control" rows="3" name = "address"></textarea>
                                </div>
                                <div class="form-group has-success">
                                    <label >����Ҫ��</label>
                                    <textarea class="form-control" rows="3" name = "require"></textarea>
                                </div>
                                <label for="pay">֧����ʽ��</label>
                                		֧������<input type="radio" name="pay" value ="֧����"checked="checked">
                                		������<input type="radio" name="pay" value ="����">
                                <input type = "hidden" name = "userName" value = "<%= userName %>">
                                <input type = "hidden" name = "nurseID" value = "<%= nurse.getNurseID() %>">
                                <input type = "hidden" name = "url" value = "nurseDetails?nurseID=<%= nurse.getNurseID() %>">
                                <input class="btn rgs-next" type = "submit" value = "ԤԼ">
                            </form>
                        </div>
		            </div>
	            </div>
             </div>
        </div>
        
        <div style="padding:7px 0px;border-bottom:1px #c1c1c1 solid"><span style="font-size:20px; font-weight:bold; padding:10px 0px;border-bottom:3px #23ac3a solid ">�û�����&nbsp;</span></div>
        <div class="evaluate">

      		<jsp:include page="evaluate.jsp">
      			<jsp:param value="<%= nurse.getNurseID() %>" name="nurseID"/>
      		</jsp:include>
        </div>
        
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