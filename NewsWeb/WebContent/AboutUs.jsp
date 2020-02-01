<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<style type="text/css">
	body{
		background:url(images/welcome.jpg);
		background-attachment: fixed;
		background-repeat: repeat;
		background-size: 100% 100%;
	}

	a{
		text-decoration: none;
	}

	.text{
		position: relative;
		top: 3vw;
		font-size: 2vw;
		font-family: "楷体";
	}
	.text1{
		font-size: 1vw;
		font-family: "楷体";
	}

	.photo{
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	.photo img{
		width: 20%;
		height: 20%;
	}

</style>
<head>
<meta charset="UTF-8">

<title>关于我们</title>
</head>
<body style="background:url(images/welcome2.jpg)">
	<% 
	try {
		String idS = request.getParameter("id"); 
		int id=Integer.parseInt(idS);
		
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");

		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(" select * from aboutus");
		
		while(rs.next()){
			if(rs.getInt("id")==id){
				break;
			}
		}
		
		String link=rs.getString("link");
		%>
			<p class="text" align="center">
   				<a href="<%=link %>">手机用户点此获取QQ名片</a>
   				<p class="text1" align="center" style="padding-top: 1vw;">请用手机浏览器打开</p>
   				</a>
			</p>
   			
   			<br><br><br><br>
   			
			<div class="photo">
   				<img src="images/us<%=id %>.jpg">
   			</div>
   			
   			
		<%
		rs.close();
	}catch(Exception e){
		System.out.print(e);
		out.print("<center><h1>连接出错！</h1></center>");
	}
	%>
	
   	
</body>
</html>