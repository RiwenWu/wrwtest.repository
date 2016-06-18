<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%> 
<html>
<body>
<jsp:useBean id="conn5" class="my_javaBean.DBUtil" scope="session" />
	<%
	Statement stmt=conn5.getConnection().createStatement();
	ResultSet rs=null; 
	//建立ResultSet（结果集）对象
	int id= Integer.parseInt(request.getParameter("id"));
	//获得所要显示图片的编号id，并转换为整型
	String sql = "select image from images WHERE id="+id; 
	//要执行查询的SQL语句
	rs=stmt.executeQuery(sql);
	while(rs.next()) {
	OutputStream sout = response.getOutputStream();
	//图片输出的输出流
	InputStream in = rs.getBinaryStream(1);
	byte b[] = new byte[1024];
	sout.write(b); 
	//将缓冲区的输入输出到页面
	in.read(b);
	sout.flush();
	//输入完毕，清除缓冲
	sout.close();
	}
	%>
</body>
</html> 