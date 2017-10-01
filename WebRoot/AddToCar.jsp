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
  
    
    <title>���ﳵ�б�</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  if(request.getParameter("commodityId")!=null){//�������ﳵ
  List<Commodity>car = null;
  if(session.getAttribute("car")==null){
  car=new ArrayList<Commodity>();  //�½����ﳵ
  }else{
  car=(List<Commodity>)session.getAttribute("car");//ȡ�ù��ﳵ
  }
  
  CommodityDAO commodityDAO=CommodityDAOFactory.getCommodityDAOInstance();
  
  int commodityId = Integer.parseInt(request.getParameter("commodityId"));
  
  //�����Ʒ�����ﳵ
  car.add(commodityDAO.findCommodityById(commodityId));
  
  session.setAttribute("car",car);//�����ﳵ������session
  }
  //����listid����
  if(request.getParameter("listId")!=null){
  //ȡ��session�еĹ��ﳵ
  List<Commodity>car=(List<Commodity>)session.getAttribute("car");
  
  
  int listId = Integer.parseInt(request.getParameter("listId"));
  car.remove(listId);//�Ƴ�listId��Ӧ��Ʒ
  session.setAttribute("car",car);
  }
   %>
  ���Ѿ�������������Ʒ:
  <table width="500" border="1">
  <tr>
  <td>��ƷID</td>
  <td>��Ʒ����</td>
  <td>��Ʒ�۸�</td>
  <td>ɾ��</td>
  </tr>
  <%--��ʾ���ﳵ�е���Ʒ --%>
  <c:forEach var="commodity" items="${sessionScope.car}" varStatus="stat">
  <tr>
  <td>${commodity.commodityId}</td>
  <td>${commodity.commodityName }</td>
  <td><fmt:formatNumber type="currency" value="${commodity.price * commodity.agio}"/></td>
  
  <td><a href="AddToCar.jsp?listId=${stat.index}">ɾ��</a></td>
  
  </tr>
  
  </c:forEach>
  <tr>
  <td><a href="ShowCommodityList.jsp">&lt;&lt;��������</a></td>
  </tr>
  <tr>
  <td colspan="3" align="right"><a href="buyitem.jsp">����˴�ȷ�Ϲ���&gt;&gt;</a></td>
  </tr>
  </table>
  </body>
</html>
