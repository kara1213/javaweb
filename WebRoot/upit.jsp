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
     
    <title>�޸���Ʒ</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
    	Connection conn = DBConnection.getConnection();
  		String sql="SELECT * FROM commodity";
  		PreparedStatement pstmt = null;
  		try{
	  		pstmt = conn.prepareStatement(sql);
	  		ResultSet rs = pstmt.executeQuery();
	  %>
	  	<form action="upit1.jsp" method="post">
  	  	ѡ����Ҫɾ������Ʒ��
  	  		<select name="commodityId">    
  				<%while(rs.next()){%>
  						<option value=<%=rs.getInt("commodityId")%>><%=rs.getString("commodityName")%></option>
  						<%} %>
  			</select>			 		
  			 	<br><br>
  		
  			 	<input type="submit" value="ȷ��"> 
  	  	</form>	
  		<%}
  		catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//�ر�Ԥ�������
			DBConnection.close(conn);							//�ر����Ӷ���
		}
		%>
  </body>
</html>
