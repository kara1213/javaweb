<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="java.sql.*" %>
<%@page import="com.sp.util.DBConnection"%>

<html>
  <head>
    <title>登录界面</title>
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
	    			out.println("用户登录成功！");	
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
	   		out.println("用户名或密码错误");	
	   		
	   	}
	    
     %>	
    <%if(ok){%>
    	<br/>
     	<a href="index.jsp" >进入首页</a><br>
     	<a href="login.jsp" ><br>注销</a>
     	<%} %>
     <%if(!ok){%>
     	<a href="login.jsp" ><br>返回</a>
     	<%} %>
  </body>
</html>
