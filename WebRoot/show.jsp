<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="com.sp.util.DBConnection"%>

<html>
  <head>
    <title>��ʾ��Ʒ</title>
  </head>
  <body>
  	
  	    ���������Ʒ���£�
	<%
   		request.setCharacterEncoding("gb2312");
   //		int userId=Integer.parseInt(session.getAttribute("id").toString());
   //String userId="admin1";
    	Connection conn = DBConnection.getConnection();
    	String sql="SELECT * FROM buyitem ";//WHERE buyUser='"+userId+"'
		PreparedStatement pstmt = null;
		try{
	  		pstmt = conn.prepareStatement(sql);
	  		ResultSet rs = pstmt.executeQuery();
	  	%>
	  		<table border="1">
    		<tr>
    			
    			<td>�µ�ʱ��</td>
    			<td>��Ʒ����</td>
    					<td>�µ��û�</td>
    		</tr>
    		<% 
	  		while(rs.next())
			{
				out.print("<tr>");
			//	out.print("<td>"+rs.getString("commodityName")+"</td>");
			//	out.print("<td>"+rs.getString("Username")+"</td>");
			//	out.print("<td>��"+rs.getDouble("price")+"</td>");
			//	out.print("<td>"+rs.getDouble("agio")+"</td>");
			//	out.print("<td>��"+rs.getDouble("x")+"</td>");
				out.print("<td>"+rs.getDate("buyData")+"</td>");
				out.print("<td>"+rs.getInt("buycommodityID")+"</td>");
				out.print("<td>"+rs.getString("buyUser")+"</td>");
				
				
					out.print("</tr>");
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							//�ر�Ԥ�������
			DBConnection.close(conn);							//�ر����Ӷ���
		}
    %>	
	</table>
	
  </body>
</html>
