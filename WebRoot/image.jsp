<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>   
<%@ page import="java.util.*"%>   
<%@ page import="java.io.*"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>图片上传</title>
</head>
<body>
<jsp:useBean id="conn4" class="my_javaBean.DBUtil" scope="session" />
	<%
	String orderName=request.getParameter("orderName");
	String orderprice=request.getParameter("orderprice");   
	String filename="/Course_Design/pic/"+request.getParameter("orderPicture");   
	//ServletInputStream str=request.getInputStream();  
	//InputStream str=new FileInputStream(filename);
	//byte b[]=new byte[str.available()];
	//str.read(b);
	//ByteArrayInputStream bi=new ByteArrayInputStream(b);
	String sql1="select orderID from images";
	
	
	Statement stmt=conn4.getConnection().createStatement();
	ResultSet rs=stmt.executeQuery(sql1);
	rs.last();
	int id=rs.getInt("orderID")+1;
	String sql="insert into images(orderID,orderName,orderprice,orderPicture) values("+id+",?,?,?)";   
	PreparedStatement pstmt=conn4.getConnection().prepareStatement(sql);   
	pstmt.setString(1,orderName);
	pstmt.setString(2,orderprice);  
	pstmt.setString(3,filename);
	//out.print(bi.available());
	try{
	pstmt.executeUpdate();   
	}catch(Exception e){
	//out.print(sql);
	out.print( e.getMessage());
	}
	out.println("Success,You Have Insert an Image Successfully");   
	
	
	%>
</body>
</html>