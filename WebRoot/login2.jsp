<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="com.sp.util.DBConnection"%>

<html>
  <head>
    <title>��¼����</title>
  </head>
  <body>
  	<%
   		request.setCharacterEncoding("gb2312");
   		String username=request.getParameter("username");
   		String pwd=request.getParameter("password");
   		
    	boolean ok=false;   //
    	
    	Connection conn = DBConnection.getConnection();
    	String sql="SELECT* FROM usertable";
  		PreparedStatement pstmt = null;
  		try{
	  		pstmt = conn.prepareStatement(sql);
	  		ResultSet rs = pstmt.executeQuery();
	  		while(rs.next())
	    	{
	    		if(username.equals(rs.getString("Username"))&&pwd.equals(rs.getString("Userpwd"))) 
	    		{    
	    			ok=true;
	    		//	session.setAttribute("id",rs.getString("UserID"));
	    			out.println("�û���¼�ɹ���");	
	    		}
	    			
	    	}
  		}
  		catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConnection.close(pstmt);							
			DBConnection.close(conn);							
		}
    	
	   	if(!ok)
	   	{
	   		out.println("�û������������");	
	   		
	   	}
	    
     %>	
    <%if(ok){%>
    	<br/>
     	<a href="index.jsp" >������ҳ</a><br>
     	<a href="login.jsp" ><br>ע��</a>
     	<%} %>
     <%if(!ok){%>
     	<a href="login.jsp" ><br>����</a>
     	<%} %>
  </body>
</html>
