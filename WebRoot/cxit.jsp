<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="com.sp.util.DBConnection"%>
<html>
  <head>
    <title>��ѯ��Ʒ</title>
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
  	  	��Ʒ���ͣ�
  	  		<select name="cType">    
  				<%while(rs.next()){%>
  						<option value=<%=rs.getInt("typeID")%>><%=rs.getString("commodityName")%></option>
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
