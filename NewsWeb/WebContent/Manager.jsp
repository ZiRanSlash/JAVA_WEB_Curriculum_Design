<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员界面</title>
</head>
<body style="background:url(images/welcome2.jpg)">
<p align="left" ><font size="5" color="">&emsp;&emsp;&emsp;&emsp;<a href="HomePage.jsp" >返回</a></font></p>
	<p>登陆成功！</p>
	<p>欢迎管理员：
	<b>
	<% 
		String name = request.getParameter("username");
		out.print(name);
	%>
	</b></p>
	
	<center><h1>文章编辑页面</h1></center>
	
	<center>
	<font size="5" color=""><a href="AddPage.jsp" target="_blank">增加文章</a></font>
	</center>
	
<%
	try {  
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");

		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");


		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(" select * from articles order by id desc");
	
	    if(con != null){  
	        //out.print("服务器连接成功！<br />");          
  
	        int counter=0;
	        while (rs.next()) {  
	        	out.print("<center><h3>");
	        	int id=rs.getInt("id");
	        	//out.print("<a href=\"Editer.jsp?id="+id+" \"target=\"_blank\">");
	        	out.print(rs.getString("title")+"——<i>"+rs.getString("little_title")+"</i> [ID:"+rs.getInt("id")+"]"); //将查询结果输出
	        	out.print("&emsp;&emsp;&emsp;<a href=\"Editer.jsp?id="+id+" \"target=\"_blank\">[编辑]</a>");
	        	out.print("&emsp;&emsp;&emsp;<a href=\"DeleteCheck.jsp?id="+id+"&username="+name+" \"target=\"_blank\">[删除]</a>");
	        	out.print("<br />"); 
	        	out.print("</h3></center>");
	        	counter++;
	   		}
	        if(counter==0){
	        	out.print("<h3>没有找到文章！</h2></br>");
	        }else{
	        	out.print("<font size=\"5\" ><b>共"+counter+"篇文章</b></font>"); 
	        }
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