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
    <title>查询物品</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%
request.setCharacterEncoding("gb2312");
int cType=Integer.parseInt(request.getParameter("cType"));
%>
 	 
 <%
 			//通过DAO工厂类获得DAO实现类实例
			CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
			
			//查找所有商品记录
	//		List<Commodity>commodityList=commodityDAO.findAllCommodity();	
	 List<Commodity>cart = null;
	cart=new ArrayList<Commodity>(); 
	cart.add(commodityDAO.findCommodityByType(cType));
			//List<Commodity>commodityList=commodityDAO.findCommodityByType(cType);
//List<Commodity>commodityList=commodityDAO.findCommodityById(cType);
			//将所有记录保存到page范围	
			pageContext.setAttribute("cart",cart);
%>
		 <table width="700" border="1">
		 	<tr>
		 		<td>商品ID</td>
		 		<td>商品名称</td>
		 		<td>商品价格</td>
		 		<td>商品折扣</td>
		 		<td>优惠价格</td>
		 		<td>  </td>
		 	</tr>
		 <c:forEach var="commodity" items="${pageScope.cart}">
	
	
	
	
		 <%-- 循环输出商品信息 --%>
		 	<tr>
		 		<td>${commodity.commodityId }</td>
		 		<td>${commodity.commodityName }</td>
		 		<td><fmt:formatNumber type="currency" value="${commodity.price}"/></td>
		 		<td>${commodity.agio }</td>
		 		<td><fmt:formatNumber type="currency" value="${commodity.price * commodity.agio}"/></td>
		 		<td><a href="AddToCar.jsp?commodityId=${commodity.commodityId}">购买</a></td>
		 	</tr>
		 </c:forEach>
		  <tr>
		 	<td colspan="3" align="center"><a href="AddToCar.jsp">&lt;&lt;返回购物页面</a></td>
		 	
		 </tr>
		 </table>

  </body>
</html>
