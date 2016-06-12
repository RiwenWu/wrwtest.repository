<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    <style type="text/css">
	<!--
	.STYLE1 {
		color: #FFCC33;
		font-size: 14px;
	}
	-->
	</style>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	<!--
	body {
		margin-top: 200px;
	}
	-->
	</style>
	
  </head>
  
  <body>
	<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F5f7f7">
		<form name="loginForm" method="post" action="<%= request.getContextPath() %>/loginServler">
			<%
				if(request.getAttribute("return_uri") != null){
			 %>
			 	<input type="hidden" name="return_uri" value="<%= request.getAttribute("return_uri") %>"/>
			<%
				}
			 %>
			<tr algin="center">
				<td height="27" colspan="2" bgcolor="#21536A" class="STYLE1">
				<strong><font size="+3">登录</font></strong>
				</td>
			</tr>
			<tr>
				<td width="200" height="22" align="center" bgcolor="#f5f7f7">用&nbsp;户&nbsp;名</td>
				<td width="300" bgcolor="#f5f7f7"><input type="text" name="adminID"></td>
			</tr>
			<tr>
			    <td height="22" align="center" bgcolor="#F5F7F7">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			    <td bgcolor="#F5F7F7"><input type="password" name="adminPswd"></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">
					<a href="register.jsp">注册</a>
				</td>
			</tr>
			<tr align="center">
			    <td height="35" colspan="2" bgcolor="#F5F7F7">
			    <input type="submit" name="Submit" value="登录">
			      &nbsp;&nbsp;
			      <input type="reset" name="Reset" value="重置"></td>
			 </tr>
		</form>
  </body>

</html>
