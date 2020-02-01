<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="creatHomePage.*" %>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Show.css">
<!-- 定义风格-->

<!-- 为了能在标签显示当前文章 把数据库连接放在title前面 -->

<!-- 用了比较笨的方法，大部分的html语句都用java的out.print来写了 -->

<%
	request.setCharacterEncoding("UTF-8"); 

	try{
		String id = request.getParameter("id"); 
		
		
		out.print("<p class=\"id\">文章ID:"+id+"</p>");
		
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
	
		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
	
		//为了获取用户访问的时间
		Date date = new Date();//获得系统时间.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(date);//将时间格式转换成符合Timestamp要求的格式.
		System.out.println("用户访问文章，ID："+id+"      "+nowTime);
	
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(" select * from articles");
		int flag=0;
		
		while(rs.next()){
			String idex=rs.getString("id");
			if(idex.equals(id)){
				flag=1;
				break;
			}
		}
		//打印title
		out.print("<title>"+rs.getString("title")+"</title>");
		//补完<head>
		out.print("</head>");
		
		//背景图片
		out.print("<body style=\"background:url(images/welcome2.jpg)\">"); 
		%>
		<a href="HomePage.jsp">
			<div class="home" align="center">
				<p>首页</p>
			</div>
		</a>
		<%
		if(flag==1){
			//标题内容和作者日期
			out.print("</br></br><h1><font face=\"宋体\"><center>"+rs.getString("title")+"</center></font></h1>");
			out.print("<h2><font face=\"宋体\"><center>——<i>"+rs.getString("little_title")+"</i></center></font></h2>");
			out.print("</br><h3><font face=\"仿宋\"><center>作者："+rs.getString("author")+"&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;日期："+rs.getString("date")+"</i></center></font></h3>");
			
			
			//正文 采用div样式
			out.print("<div class=\"content\"><font face=\"宋体\">");
			out.print(rs.getString("text"));
			out.print("</font></div>");
			
			out.print("<div class=\"border\"></div>");
		}else{
			out.print("<h1><center>此文章不存在！</center></h1>");
		}
	}catch(Exception e){
		System.out.print(e);
		out.print("<title>新闻网站——服务器连接失败！</title>");
		out.print("</head>");
		out.print("<h1><center>服务器连接失败！</center></h1>");
	}
%>
    
</body>
</html>