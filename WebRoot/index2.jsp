<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  <!--    This is my JSP page. <br>
    address:    localhost:8080/..<br>
    shopping/ShowCommodityList.jsp<br>
    shopping/AddToCar.jsp<br>
     <img src="images/itemA.jpg"  border=0 height=60 width=60>
  -->
  
      <a href="addit.jsp" >�����Ʒ</a><br><br>
      <a href="upit.jsp" >�޸���Ʒ��ɾ����</a><br><br>
  
       	<a href="index.jsp" ><br>������ҳ</a>
  </body>
</html>
