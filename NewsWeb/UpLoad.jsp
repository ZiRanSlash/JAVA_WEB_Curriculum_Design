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
	//String date = request.getParameter("date");
	String text = request.getParameter("text");
	%>
	
	<%
		 Date date = new Date();//获得系统时间.
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String nowTime = sdf.format(date);//将时间格式转换成符合Timestamp要求的格式.
		 //Timestamp dates =Timestamp.valueOf(nowTime);//把时间转换
	%>
	
	<%--
	out.print(title+"</br>");
	out.print(little_title+"</br>");
	out.print(author+"</br>");
	out.print(date+"</br>");
	out.print(text+"</br>");
	
	--%>
	
	
	<%
	int i,j;
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
	
		String sql="Insert into articles values(?,?,?,?,?,?)";
		String sql_check = "update check_table set id=?, total=? where name=? ";
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(" select * from check_table ");
		
		int total=-1;
		while(rs.next()){
			total=rs.getInt("total");
		}
		total++;
		
		try{
			//3.创建PreparedStatement对象
			PreparedStatement pmst = con.prepareStatement(sql);
			
			//4.为占位符传值
			pmst.setInt(1, id);
			pmst.setString(2, title);
			pmst.setString(3, little_title);
			pmst.setString(4, author);
			pmst.setString(5, nowTime);
			pmst.setString(6, text);
			
			i = pmst.executeUpdate();
			pmst.close();
			
			String temp="newsweb";
			PreparedStatement pmst_check = con.prepareStatement(sql_check);
			pmst_check.setInt(1, id);
			pmst_check.setInt(2, total);
			pmst_check.setString(3, temp);
			
			j = pmst_check.executeUpdate();
			pmst_check.close();
			//释放资源
			if(i>0){
				 out.print("<br><center><h1>文章添加成功！</center></h1><br>");
				 //out.print("<center>i="+i+"_____j="+j+"</center>");
				 out.print("<br><br><center><h1>页面将自动跳转回主页面</h1></center>");
				response.setHeader("refresh", "3;URL=HomePage.jsp");
			}else{
				 out.print("<br><center><h1>数据插入失败！</center></h1><br>");
				 //out.print("<center>i="+i+"_____j="+j+"</center>");
				 out.print("<br><br><center><h1>页面将自动跳转回主页面</h1></center>");
				 response.setHeader("refresh", "3;URL=HomePage.jsp");
			}
			
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