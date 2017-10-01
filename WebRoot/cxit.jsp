<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="com.sp.util.DBConnection"%>
<html>
  <head>
    <title>查询物品</title>
  </head>
  <body>
  	<%
    	Connection conn = DBConnection.getConnection();
  		String sql="SELECT * FROM typename";
  		PreparedStatement pstmt = null;
  		try{
	  		pstmt = conn.prepareStatement(sql);
	  		ResultSet rs = pstmt.executeQuery();
	  %>
	  	<form action="cxit1.jsp" method="post">
  	  	商品类型：
  	  		<select name="cType">    
  				<%while(rs.next()){%>
  						<option value=<%=rs.getInt("typeID")%>><%=rs.getString("commodityName")%></option>
  						<%} %>
  			</select>			 		
  			 	<br><br>
  			 	<input type="submit" value="确定"> 
  	  	</form>	
  		<%}
  		catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//关闭预处理对象
			DBConnection.close(conn);							//关闭连接对象
		}
		%>
  </body>
</html>
