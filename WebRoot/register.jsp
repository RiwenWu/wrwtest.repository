<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
    <div align=center>  
	<table width="67%"  border="0" cellpadding="0" cellspacing="0" >
  	<tr>
    	<td width="100%" >
			<div align="center" >
	      		<p class="textTitle">用户注册</p> 
	    	</div>	 
    		<hr color="#6FB7B7">	  
    	</td>
    </tr>
  	<tr>
    <td height="345"  valign="top">
		<form name="form1" method="post" action="<%= request.getContextPath() %>/registerServlet">
			
  			<table width="100%" height="261" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
     			<tr>
      				<td width="138" height="32">
	    				<div align="right">账号: &nbsp;</div>
	    			</td>
      				<td width="687">
	      				<label>
	        				<input name="user_name" type="text" class="area" value="" size="36">
	      				</label>
      				</td>
    			</tr>
				<tr>
      				<td ><div align="right">密码:&nbsp; </div></td>
      			<td>
	      			<label>
	        			<input name="user_pwd" type="password" class="area" value="" size="30">
	      			</label>
      			</td>
    			</tr>
				<tr>
			      	<td height="61" colspan="2">
			      	<label>
			         	<div align="center">
			        		<input name="Submit" type="submit" class="buttonCom" value=" 保 存">
			        		<input name="Submit2" type="reset" class="buttonCom" value="  清  除  ">       
			         	</div>
			      	</label>        <label></label></td>
			    </tr>
  		    </table>
		</form>	
  	</td>
    </tr>	
    </table>
	</div>
  </body>
</html>
