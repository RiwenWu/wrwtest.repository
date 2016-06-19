<%@ page language="java" import="java.util.*,java.sql.*,javax.sql.*,javax.naming.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
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
  
    <h1>我是购物中心</h1>
    
       <jsp:useBean id="conn6" class="my_javaBean.DBUtil" scope="session" />
			<form action="fake_shoppingcar.jsp">
			<table border=black 1px solid>
			<tr>
				<td>商品序号</td>
				<td>商品</td>
				<td>商品名称</td>
				<td>单价</td>
				<td>数量</td>
				<td>购物篮</td>
			</tr>
			<% 
				Statement stmt=conn6.getConnection().createStatement();
				String sql=new String();
				sql= "select orderID,orderPicture,orderName,orderprice from images";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
			 %>
				<tr border="black 1px solid">
					<td><%=rs.getInt("orderID") %></td>
					<td><img src="<%=rs.getString("orderPicture") %>" height=99 width=133></img></td>
					<td><%=rs.getString("orderName") %></td>
					<td><%=rs.getDouble("orderprice") %></td>
					<td><input type='text' name='<%=rs.getInt("orderID")%>' value="1" size=3 style="text-align:right;" maxlength='3'></td>
 					<td><input type='checkbox' name="order" value='<%=rs.getInt("orderID")%>'></td>
				</tr>
				<%
				//将每条商品的信息保存到session
				session.setAttribute(String.valueOf(rs.getInt("orderID")),rs.getInt("orderID")+","+rs.getString("orderPicture")+","+rs.getString("orderName")+","+rs.getDouble("orderprice"));
			 	}
			 	%>
			 	
			</table>
			<input type='submit' value='确定订购' >
		</form>
    <a href="<%= request.getContextPath() %>/index.jsp">返回首页</a>
  </body>
</html>
