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
		//��ȡҪ��ѯ�Ķ�����
		String orderid = request.getParameter("orderid");
		//��ȡ��������Ϣ
		if(application.getAttribute(orderid) != null)
		{
  	 		out.print("�����ţ�" + orderid + "<br><br>");
   		 	out.print("��Ʒ���&nbsp;&nbsp;&nbsp;��Ʒ����&nbsp;&nbsp;&nbsp;&nbsp;" + "&nbsp;&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;&nbsp;����");
			Vector vc = (Vector)application.getAttribute(orderid);
			Iterator it = vc.iterator();
			while(it.hasNext())
			{	
				
				out.print("<hr>" + it.next() + "<br>");
			}
			out.println("<br><br><a href='index.jsp'>������ҳ</a>");
		}else
		{
			out.print("~����������~~");
		 	out.println("<br><br><a href='index.jsp'>������ҳ</a>");
		}
	 %>
</body>
</html>