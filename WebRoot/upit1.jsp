<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.sp.dao.CommodityDAO"  %>
<%@ page import="com.sp.factory.CommodityDAOFactory" %>
<%@ page import="com.sp.bean.Commodity"  %>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>ɾ����Ʒ</title>

  </head>
  
 <body>
  <jsp:useBean id="com" scope="page" class="com.sp.bean.Commodity"></jsp:useBean>
  <% 
  	request.setCharacterEncoding("utf-8");
    CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
    
 
    commodityDAO.deleteCommodity(Integer.parseInt(request.getParameter("commodityId")));
    
    %>
    
   <%--  <jsp:forward page="ShowCommodityList.jsp"></jsp:forward> --%>
        ��ɾ������Ʒ<br>
	<a href="ShowCommodityList.jsp" >�鿴������Ʒ</a>
    <a href="upit.jsp" >����ɾ��</a>
  </body>

</html>
