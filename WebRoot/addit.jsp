<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="com.sp.util.DBConnection"%>
<%
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>�����Ʒ</title>
    
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->

  </head>
   <body>
  <form action="addit1.jsp"method="post">
 
     <table "border="1">
     
    <tr><td>��Ʒ����:<input type="text" name="commodityName"/></td></tr>
    <tr><td>��Ʒ�۸�:<input type="text" name="price"/></td></tr>
    <tr><td>��Ʒ�ۿ�:<input type="text" name="agio"/></td></tr>
    <tr><td>ͼƬ��ַ��<input type="text" name="image" placeholder="���磺images/itemA.jpg"/></td></tr>
   
    <tr><td><input type="submit" value="���"/></td></tr>
     	
     	
     </table>
     </form>
  </body>
</html>
