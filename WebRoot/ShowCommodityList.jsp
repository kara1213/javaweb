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
   
    
    <title>��Ʒ�б�</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body> 
 <%--${4>2?"YES":"NO" }<br> --%> 
  
  <%
  //ͨ��DAO��������DAOʵ����ʵ��
  CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
  //������Ʒ
  List<Commodity>commodityList=commodityDAO.findAllCommodity();
  //�����¼��page
  pageContext.setAttribute("commodityList",commodityList);
   %>
   <table width="700" border="1">
   <tr>
   <td>��ƷID</td>
   <td>��ƷԤ��</td>
   <td>��Ʒ����</td>
   <td>��Ʒ�ۿ�</td>
   <td>�Żݼ۸�</td>
   <td>����</td>
   </tr>
   <%--��ʾ��Ʒ --%>
   <c:forEach var="commodity" items="${pageScope.commodityList}">
   <tr>
   <td>${commodity.commodityId }</td>
   <td><img src='${commodity.image}'  border=0 height=60 width=60></td>
   <td>${commodity.commodityName }</td>
   <td><fmt:formatNumber type="currency" value="${commodity.price }"/></td>
   <td>${commodity.agio }</td>
   <td><fmt:formatNumber type="currency" value="${commodity.price * commodity.agio }"/></td>
   <td><a href="AddToCar.jsp?commodityId=${commodity.commodityId }">����</a></td>
   </tr>
   
   </c:forEach>
  <tr>
  
  <td><a href="AddToCar.jsp">�鿴���ﳵ&gt;&gt;</a></td>
  </tr>
  <tr>
  <td><a href="cxit.jsp" >ͨ����Ʒ���Ͳ�ѯ��Ʒ&gt;&gt;</a></td>
  <%-- &gt = > --%>
  </tr>
   </table>

     	<a href="index.jsp" ><br>������ҳ</a>
  </body>
</html>
