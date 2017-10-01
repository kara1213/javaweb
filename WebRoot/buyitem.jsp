<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@page import="com.sp.bean.Commodity"%>
<%@page import="com.sp.dao.CommodityDAO"%>
<%@page import="com.sp.factory.CommodityDAOFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
  <head>
    <title>确定购买</title>
  </head>
  <body>
 	
   	<%
    	Connection conn=null;
    	Statement stat=null;
    	Class.forName("com.mysql.jdbc.Driver").newInstance();
    	String url="jdbc:mysql://localhost:3306/shopping";
    	String user="root";
    	String password="123";
    	conn=DriverManager.getConnection(url,user,password);
    	stat=conn.createStatement();
  //  	PreparedStatement statt=null;
   %>
    <c:forEach var="commodit" items="${sessionScope.car}" varStatus="stat1">
    	<% 
    		int commodityId=((Commodity)pageContext.findAttribute("commodit")).getCommodityId();
    	//	int userId=Integer.parseInt(session.getAttribute("id").toString());
    	    String userId="admin1";
    		java.util.Date date=new java.util.Date();
    		java.sql.Date date1=new java.sql.Date(date.getTime());  
    		String sql="insert into buyitem(buycommodityID,buyUser,buyData) VALUES('"+commodityId+"','"+userId+"','"+date1+"')"; 
    		//buycommodityId
    	//	    		statt=conn.prepareStatement(sql);
    	//	statt.executeUpdate();
stat.executeUpdate(sql);
    	//	PreparedStatement pstmt=null;
		//	pstmt=conn.prepareStatement(updateSQL);
		//	pstmt.executeUpdate();
    	%>  
    </c:forEach>
    
    <%
    	if(stat!=null)
    	{
    		stat.close();
    	}
    	if(conn!=null)
    	{
    		conn.close();
    	}
    	
    %>
	您已购买成功<br>
	<a href="show.jsp" >查看购买记录</a>
	   	
  </body>
</html>
