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
   
    
    <title>商品列表</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
 <%--${4>2?"YES":"NO" }<br> --%> 
  
  <%
  //通过DAO工厂类获得DAO实现类实例
  CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
  //遍历商品
  List<Commodity>commodityList=commodityDAO.findAllCommodity();
  //保存记录到page
  pageContext.setAttribute("commodityList",commodityList);
   %>
   <table width="700" border="1">
   <tr>
   <td>商品ID</td>
   <td>商品预览</td>
   <td>商品名称</td>
   <td>商品折扣</td>
   <td>优惠价格</td>
   <td>购买</td>
   </tr>
   <%--显示商品 --%>
   <c:forEach var="commodity" items="${pageScope.commodityList}">
   <tr>
   <td>${commodity.commodityId }</td>
   <td><img src='${commodity.image}'  border=0 height=60 width=60></td>
   <td>${commodity.commodityName }</td>
   <td><fmt:formatNumber type="currency" value="${commodity.price }"/></td>
   <td>${commodity.agio }</td>
   <td><fmt:formatNumber type="currency" value="${commodity.price * commodity.agio }"/></td>
   <td><a href="AddToCar.jsp?commodityId=${commodity.commodityId }">购买</a></td>
   </tr>
   
   </c:forEach>
  <tr>
  
  <td><a href="AddToCar.jsp">查看购物车&gt;&gt;</a></td>
  </tr>
  <tr>
  <td><a href="cxit.jsp" >通过商品类型查询商品&gt;&gt;</a></td>
  <%-- &gt = > --%>
  </tr>
   </table>

     	<a href="index.jsp" ><br>返回首页</a>
  </body>
</html>
