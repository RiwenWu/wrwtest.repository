<%@ page language="java" import="java.util.*,java.sql.*,javax.sql.*,javax.naming.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <h1 align="center">首页</h1>
    <%
    	String flag = "";
    	Object obj = session.getAttribute("flag");
    	Object userID = session.getAttribute("userID");
    	
    	if(obj !=null){
    		flag = obj.toString();
    		userID = userID.toString();
    		flag.equals("login_success");
     %>
     	<a>欢迎<%= userID%>登录</a>
     	<a href="/Course_Design/logoutServlet">退出</a>
     <%
     	}else{
      %>
      	<a href="login.jsp">登录</a>
      <%
      	}
       %>
       <br/>
       <a href="shopping_car.jsp">购物车</a>
       
       <jsp:useBean id="conn6" class="my_javaBean.DBUtil" scope="session" />
			<% 
				Statement stmt=conn6.getConnection().createStatement();
				String sql=new String();
				sql= "select orderPicture,orderName,orderprice from images";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
			 %>
			<table>
				<tr>
					<td><img src="<%=rs.getString("orderPicture") %>"></img></td>
					<td><%=rs.getString("orderName") %></td>
					<td><%=rs.getDouble("orderprice") %></td>
				</tr>
				<%
			 	}
			 	%>
			</table>
  </body>
</html>
