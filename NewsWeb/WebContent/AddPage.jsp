<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="creatHomePage.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加文章</title>
</head>
<body style="background:url(images/welcome2.jpg)">
	<p align="left" ><font size="5" color="">&emsp;&emsp;&emsp;&emsp;<a href="Manager.jsp" >返回</a></font></p>
	<center><h1>增加文章</h1></center>
	
	<%
		int count=0;
		try {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
	
			con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
	
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(" select * from check_table");
			
		    if(con != null){   
		    	while(rs.next()){
		        	count=rs.getInt("id"); 
		    	}
		    }
		    else{  
		    	count=-1;
		    }  
	
		} catch (Exception e) {
			count=-1;
		}
		
		
		if(count==-1){
			out.print("<center><h2>发生错误！<br>即将返回主界面......</h2><center>");
			response.setHeader("refresh", "3;URL=HomePage.jsp");
		}else{
			count++;
			out.print("<center><h2>将添加的文章ID为："+count+"(系统自动分配)</h2></center>");
		}
	%>
	
	<form action="UpLoad.jsp" method="post">
		<input type="hidden" name="id" value=<%=count %>>
		
		<center><p>
  		标题: <input type="text" name="title" />
  		&emsp;&emsp;&emsp;&emsp;&emsp;小标题: <input type="text" name="little_title" />
  		
  		&emsp;&emsp;&emsp;&emsp;&emsp;作者: <input type="text" name="author" />
  		<!--<input type="hidden" name="date" value=<%--=nowTime --%>>-->
  		<!-- <center><p>内容: <textarea name="date" cols="20" rows="1"/><%--=nowTime --%></textarea> </p></center> -->
  		<center><p>内容: <textarea name="text" cols="200" rows="32"/>在此输入文本内容，在每一段后面加上&lt;/br&gt;</textarea> </p></center>
  		<center><p><input type="submit" value="Submit" /></p></center>
	</form>
</body>
</html>