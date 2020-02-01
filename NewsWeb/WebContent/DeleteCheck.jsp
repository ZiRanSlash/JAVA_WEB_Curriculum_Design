<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="creatHomePage.*" %>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/Show.css">
<title>删除确认</title>
</head>
<body style="background:url(images/welcome2.jpg)">
	<%
		request.setCharacterEncoding("UTF-8"); 
	
	try{
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
	
		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(" select * from articles");
		
		while(rs.next()){
			if(id.equals(rs.getString("id"))){
				break;
			}
		}
		
		out.print("<center><h1><br><br><br><br>您将删除</h1></center");
		out.print("<center><h2><br><br>"+rs.getString("title")+"--<i>"+rs.getString("little_title")+"</i></h2></center");
		out.print("<center><h1><br>文章ID：【"+id+"】</h1></center");
		out.print("<center><h1><br><br>是否继续？</h1><br></center");
		%>
		<center>
			<center>
				<table>
					<form form action="Manager.jsp" name="" method="post">
						<input type="hidden" name="username" value=<%=username %>>
						<input type="submit" value="返回">
					</form>
					&emsp;&emsp;&emsp;&emsp;
					<form form action="Delete.jsp" name="" method="post">
						<input type="hidden" name="id" value=id>
						<input type="submit" value="删除">
					</form>
				</table>
			</center>
		</center>
		<%
		
	}catch(Exception e){
		System.out.print(e);
		out.print("<center><h1><br><br>发生错误！</h1></center>");
		out.print("<center><h1><br><br>即将跳转回主页面</h1></center>");
		response.setHeader("refresh", "3;URL=HomePage.jsp");
	}
	%>
</body>
</html>