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
<title>Insert title here</title>
</head>
<body>
	<div class="l_slider js_variablewidth variablewidth">
    	<div class="frame js_frame">
        	<ul class="slides js_slides">
	<% 
		String userName = (String)session.getAttribute("AyllLoginName");
		UserDao userDao = new UserDao();
		int i;
		if(userName != null) {
			
			ArrayList<Nurse> nurse1 = userDao.userRecommend(userName);
			
			for (Nurse nurse : nurse1) {
				
	%>
				<li class="js_slide">
                 	<div class="synopsis">
                    	<a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                        	<div class="head"><img src="images/nurse/<%= nurse.getPicture() %>"></div>
                            <div class="starability-container">
                            <form>
                            	<fieldset class="starability-basic">
                                	<span style="padding:0px 10px;">星级：</span>
                                    <% 
                                    	int star = nurse.getStar();
                                    	
                                        for (i = 5; i > 0; i--) {
                                        			
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
                                    <p><span>服务类型：</span><%= nurse.getNursekind() %><br>
                                    <span>服务地区：</span><%= nurse.getNurseArea() %><br>
                                    <span>简介：</span><%= nurse.getInformation() %>
                                    </p>
                                </a>
                                <a href="#" class="order"><img src="images/order.png"></a>
                            </div>
                        </li>
                    <% 
							} 
						} else {
							
							ArrayList<Nurse> nurse2 = userDao.getRecommendByKind("母婴护理");
							
							for (Nurse nurse : nurse2) {
						
                    %>
                    <div class="synopsis">
                    	<a href="nurseDetails.jsp?nurseID=<%= nurse.getNurseID() %>">
                        	<div class="head"><img src="images/nurse/<%= nurse.getPicture() %>"></div>
                            <div class="starability-container">
                            <form>
                            	<fieldset class="starability-basic">
                                	<span style="padding:0px 10px;">星级：</span>
                                    <% 
                                    	int star = nurse.getStar();
                                        for (i = 5; i > 0; i--) {
                                        			
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
                                    <p><span>服务类型：</span><%= nurse.getNursekind() %><br>
                                    <span>服务地区：</span><%= nurse.getNurseArea() %><br>
                                    <span>简介：</span><%= nurse.getInformation() %>
                                    </p>
                                </a>
                                <a href="#" class="order"><img src="images/order.png"></a>
                            </div>
                    <%
							}
						}	
           			 %>
                    </ul>
                </div>

                 <span class="js_prev prev">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 501.5 501.5"><g><path fill="#2E435A" d="M302.67 90.877l55.77 55.508L254.575 250.75 358.44 355.116l-55.77 55.506L143.56 250.75z"/></g></svg>
                </span>

                <span class="js_next next">
                    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 501.5 501.5"><g><path fill="#2E435A" d="M199.33 410.622l-55.77-55.508L247.425 250.75 143.56 146.384l55.77-55.507L358.44 250.75z"/></g></svg>
                </span>
            </div>
            
</body>
</html>