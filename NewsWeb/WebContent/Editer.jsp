<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>文章更改确认</title>
</head>
<body style="background:url(images/welcome2.jpg)">
<%
	request.setCharacterEncoding("UTF-8"); 
	
	String ids = request.getParameter("id"); 
	
	int id=Integer.parseInt(ids);
	
	try {  
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
	
		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
	
	
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(" select * from articles");
	
	    if(con != null){  
	        //out.print("服务器连接成功！<br />");          
	
	        int idx;
	        while (rs.next()) {  
	        	idx=rs.getInt("id");
	        	if(idx==id){
	        		break;
	        	}
	   		}
	        String title=rs.getString("title");
	        String little_title=rs.getString("little_title");
	        String author=rs.getString("author");
	        String date=rs.getString("date");
	        String text=rs.getString("text");
	        
	        %><center><h1><br>文章编辑页面<br></h1></center><%
	    %><form action="Change.jsp" method="post"><%
	        %><input type="hidden" name="id" value=<%=ids %>><%
	        %><center><p><%
	        %>标题: <textarea name="title" cols="20" rows="1"/><%=title%></textarea> <%
	        %>&emsp;&emsp;&emsp;&emsp;&emsp;小标题: <textarea name="little_title" cols="20" rows="1"/><%=little_title%></textarea> <%
	        %></p></center><%
	        
	        %><center><p><%
	        %>作者: <textarea name="author" cols="20" rows="1"/><%=author%></textarea> <%
	        %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;日期: <textarea name="date" cols="20" rows="1"/><%=date%></textarea> <%
	        %></p></center><%
	        
	        %><center><p>内容: <textarea name="text" cols="200" rows="33"/><%=text%></textarea> </p></center><%
	  		%><center><p><input type="submit" value="Submit" /></p></center><%
		%></form><%
	    }
	    else{  
	        out.print("连接失败！");  
	    } 
	    
	    
	    
	}catch (Exception e) {        
	    out.print("数据库连接异常！");  
	    System.out.println(e);
	}

%>
</body>
</html>