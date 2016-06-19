<%@ page language="java" import="java.util.*,my_javaBean.DBUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fake_shoppingcar.jsp' starting page</title>
    
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
    <h1>你所订购的商品：</h1>
	<ol>
	 <% 
	 	//获取用户选择了哪一个商品
	 	String id[] = request.getParameterValues("order");
		//订单id
		int orderid = 1;
		//保存订单中的信息
		Vector vc = new Vector();
			if(application.getAttribute("orderid") == null)
			{
					application.setAttribute("orderid",orderid);
			}
			else
			{
			//订单id不断叠加
				orderid = (Integer)application.getAttribute("orderid") + 1;
			}
		
	 	double count = 0;
	 	double end = 0; 
	  	DBUtil obj = new DBUtil();
		
	    //获取用户选择了哪一个商品
		
		for(int i = 0 ; i < id.length; i++)
		{
			out.print("<hr>");
			String info[] = ((String)session.getAttribute(id[i])).split(",");
			obj.addOrderInfo(orderid,Integer.parseInt(info[0]), info[2] ,Double.parseDouble(info[3]),Integer.parseInt(request.getParameter(id[i])));
	%>
	 <li>
		<% 	
			//用户选择的商品以及数量
			String goodsAndNumber =  "  <img src='" + info[1] + "' height=99 width=133></img>  " +info[2] + "  " +"单价"+info[3]+" "+ "数量：" + request.getParameter(id[i]) + " ";
			
			 //计算价钱
			 end = Double.parseDouble(request.getParameter(id[i])) * Double.parseDouble(info[3]);
			 
			 //计算总价钱
			  count+=end;	
			 //输出用户选择的商品，数量以及价钱	 
			 out.print(goodsAndNumber + "合计：" + end );		
		     vc.add(goodsAndNumber + "合计：" + end );
		%>
	</li>
	<%
		} 
		out.println("<hr>您共花费：" + count + "<br>");
		out.println("<hr>订单号为：" + orderid + "<br><hr>");
		
		//保存订单的id，以便下次购物可以分配订单id
		application.setAttribute("orderid",orderid);
		//保存该订单的信息
		application.setAttribute(String.valueOf(orderid),vc);		
	 %>
	
	</ol>
	<a href="select_order.jsp">查询订单</a>
  </body>
</html>
