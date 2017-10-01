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
  
    
    <title>购物车列表</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  if(request.getParameter("commodityId")!=null){//声明购物车
  List<Commodity>car = null;
  if(session.getAttribute("car")==null){
  car=new ArrayList<Commodity>();  //新建购物车
  }else{
  car=(List<Commodity>)session.getAttribute("car");//取得购物车
  }
  
  CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
  
  int commodityId = Integer.parseInt(request.getParameter("commodityId"));
  
  //添加商品到购物车
  car.add(commodityDAO.findCommodityById(commodityId));
  
  session.setAttribute("car",car);//将购物车保存在session
  }
  //根据listid更新
  if(request.getParameter("listId")!=null){
  //取得session中的购物车
  List<Commodity>car=(List<Commodity>)session.getAttribute("car");
  
  
  int listId = Integer.parseInt(request.getParameter("listId"));
  car.remove(listId);//移出listId对应商品
  session.setAttribute("car",car);
  }
   %>
  你已经购买了如下商品:
  <table width="500" border="1">
  <tr>
  <td>商品ID</td>
  <td>商品名称</td>
  <td>商品价格</td>
  <td>删除</td>
  </tr>
  <%--显示购物车中的商品 --%>
  <c:forEach var="commodity" items="${sessionScope.car}" varStatus="stat">
  <tr>
  <td>${commodity.commodityId}</td>
  <td>${commodity.commodityName }</td>
  <td><fmt:formatNumber type="currency" value="${commodity.price * commodity.agio}"/></td>
  
  <td><a href="AddToCar.jsp?listId=${stat.index}">删除</a></td>
  
  </tr>
  
  </c:forEach>
  <tr>
  <td><a href="ShowCommodityList.jsp">&lt;&lt;继续购物</a></td>
  </tr>
  <tr>
  <td colspan="3" align="right"><a href="buyitem.jsp">点击此处确认购买&gt;&gt;</a></td>
  </tr>
  </table>
  </body>
</html>
