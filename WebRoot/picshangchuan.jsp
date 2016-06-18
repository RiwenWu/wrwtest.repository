<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>上传文件</title>
  </head> 
  <body>
  <form name="upform" action="/Course_Design/shangchuanServlet" method="post" enctype="multipart/form-data">
    <input type ="file" name="file1" id="file1"/><br/>
    <input type="submit" value="Submit" />
    <input type="reset" />
  </form>
   </body>
</html>
