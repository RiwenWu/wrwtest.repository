<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
	 <% 
		//获取要查询的订单号
		String orderid = request.getParameter("orderid");
		//获取订单的信息
		if(application.getAttribute(orderid) != null)
		{
  	 		out.print("订单号：" + orderid + "<br><br>");
   		 	out.print("商品编号&nbsp;&nbsp;&nbsp;商品名称&nbsp;&nbsp;&nbsp;&nbsp;" + "&nbsp;&nbsp;&nbsp;&nbsp;单价&nbsp;&nbsp;&nbsp;&nbsp;数量");
			Vector vc = (Vector)application.getAttribute(orderid);
			Iterator it = vc.iterator();
			while(it.hasNext())
			{	
				
				out.print("<hr>" + it.next() + "<br>");
			}
			out.println("<br><br><a href='index.jsp'>返回首页</a>");
		}else
		{
			out.print("~订单不存在~~");
		 	out.println("<br><br><a href='index.jsp'>返回首页</a>");
		}
	 %>
</body>
</html>