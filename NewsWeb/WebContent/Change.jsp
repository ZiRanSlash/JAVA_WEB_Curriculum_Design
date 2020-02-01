<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>上传确认</title>
</head>
<body style="background:url(images/welcome2.jpg)">
	<%
	request.setCharacterEncoding("UTF-8");
	String ids = request.getParameter("id");
	
	int id=Integer.parseInt(ids); 
	
	String title = request.getParameter("title");
	String little_title = request.getParameter("little_title");
	String author = request.getParameter("author");
	String date = request.getParameter("date");
	String text = request.getParameter("text");
	%>
	
	
	
	<%--
	out.print(title+"</br>");
	out.print(little_title+"</br>");
	out.print(author+"</br>");
	out.print(date+"</br>");
	out.print(text+"</br>");
	
	--%>
	
	
	<%
	if(title.equals("")){
		out.print("<br><br><br><br><center><h1>标题不能为空！</center></h1><br>");
		out.print("<br><br><center><h1>页面将自动跳转回上传页面</h1></center>");
		response.setHeader("refresh", "3;URL=AddPage.jsp");
	}else if(little_title.equals("")){
		out.print("<br><br><br><br><center><h1>小标题不能为空！</center></h1><br>");
		out.print("<br><br><center><h1>页面将自动跳转回上传页面</h1></center>");
		response.setHeader("refresh", "3;URL=AddPage.jsp");
	}else if(author.equals("")){
		out.print("<br><br><br><br><center><h1>作者不能为空！</center></h1><br>");
		out.print("<br><br><center><h1>页面将自动跳转回上传页面</h1></center>");
		response.setHeader("refresh", "3;URL=AddPage.jsp");

	}else if(text.equals("")){
		out.print("<br><br><br><br><center><h1>内容不能为空！</center></h1><br>");
		out.print("<br><br><center><h1>页面将自动跳转回上传页面</h1></center>");
		response.setHeader("refresh", "3;URL=AddPage.jsp");
	}else{
	
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
	
		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
	
		
		try{
			String sql = "update articles set title=?, little_title=?, author=?, date=?,text=? where id=? ";
			
			PreparedStatement pmst = con.prepareStatement(sql);
			
			//4.为占位符传值
	
			pmst.setString(1, title);
			pmst.setString(2, little_title);
			pmst.setString(3, author);
			pmst.setString(4, date);
			pmst.setString(5, text);
			pmst.setInt(6, id);
			
			
			//5.执行sql语句
			int i = pmst.executeUpdate();
			if(i>0){
				out.print("<br><center><h1>文章更改成功！</center></h1><br>");
				out.print("<br><br><center><h1>页面将自动跳转回主页面</h1></center>");
				response.setHeader("refresh", "3;URL=HomePage.jsp");
			}else{
				out.print("<br><center><h1>文章更改失败！</center></h1><br>");
				out.print("<br><br><center><h1>页面将自动跳转回主页面</h1></center>");
				response.setHeader("refresh", "3;URL=HomePage.jsp");
			}
			pmst.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.print(e);
			out.print("<br>数据插入失败！");
		}	
	}
	%>
	
	
</body>
</html>