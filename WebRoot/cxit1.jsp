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
    <title>��ѯ��Ʒ</title>
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
 			//ͨ��DAO��������DAOʵ����ʵ��
			CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
			
			//����������Ʒ��¼
	//		List<Commodity>commodityList=commodityDAO.findAllCommodity();	
	 List<Commodity>cart = null;
	cart=new ArrayList<Commodity>(); 
	cart.add(commodityDAO.findCommodityByType(cType));
			//List<Commodity>commodityList=commodityDAO.findCommodityByType(cType);
//List<Commodity>commodityList=commodityDAO.findCommodityById(cType);
			//�����м�¼���浽page��Χ	
			pageContext.setAttribute("cart",cart);
%>
		 <table width="700" border="1">
		 	<tr>
		 		<td>��ƷID</td>
		 		<td>��Ʒ����</td>
		 		<td>��Ʒ�۸�</td>
		 		<td>��Ʒ�ۿ�</td>
		 		<td>�Żݼ۸�</td>
		 		<td>  </td>
		 	</tr>
		 <c:forEach var="commodity" items="${pageScope.cart}">
	
	
	
	
		 <%-- ѭ�������Ʒ��Ϣ --%>
		 	<tr>
		 		<td>${commodity.commodityId }</td>
		 		<td>${commodity.commodityName }</td>
		 		<td><fmt:formatNumber type="currency" value="${commodity.price}"/></td>
		 		<td>${commodity.agio }</td>
		 		<td><fmt:formatNumber type="currency" value="${commodity.price * commodity.agio}"/></td>
		 		<td><a href="AddToCar.jsp?commodityId=${commodity.commodityId}">����</a></td>
		 	</tr>
		 </c:forEach>
		  <tr>
		 	<td colspan="3" align="center"><a href="AddToCar.jsp">&lt;&lt;���ع���ҳ��</a></td>
		 	
		 </tr>
		 </table>

  </body>
</html>
