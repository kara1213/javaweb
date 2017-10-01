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
  
    
    <title>添加物品</title>
    
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->

  </head>
   <body>
  <form action="addit1.jsp"method="post">
 
     <table "border="1">
     
    <tr><td>商品名称:<input type="text" name="commodityName"/></td></tr>
    <tr><td>商品价格:<input type="text" name="price"/></td></tr>
    <tr><td>商品折扣:<input type="text" name="agio"/></td></tr>
    <tr><td>图片地址：<input type="text" name="image" placeholder="比如：images/itemA.jpg"/></td></tr>
   
    <tr><td><input type="submit" value="添加"/></td></tr>
     	
     	
     </table>
     </form>
  </body>
</html>
