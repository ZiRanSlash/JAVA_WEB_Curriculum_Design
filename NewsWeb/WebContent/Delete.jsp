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
<title>删除文章</title>
</head>
<body style="background:url(images/welcome2.jpg)">
	<%
	
		request.setCharacterEncoding("UTF-8"); 
		
		int j=0;
		try{
			String idx = request.getParameter("id"); 
			System.out.println("删除文章的ID为："+idx);
			int id=Integer.parseInt(idx);
			System.out.print("整形的ID为："+id);
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
	
			con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
			
			
			//删除文章
			String sql_delete="delete from articles where id='"+id+"'";
			  //获取要删除的此id的数据库信息
			  //int idx=Integer.parseInt(id);
			  
			  	PreparedStatement pst=con.prepareStatement(sql_delete);
			 	int i=pst.executeUpdate();
			 	pst.close();
			  
			 	
			 	//更新total
			  	Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(" select * from check_table ");
				
				int total=-1;
				while(rs.next()){
					total=rs.getInt("total");
				}
				total--;
				
				String sql = "update check_table set total=? where name=? ";
				
				String temp="newsweb";
				
				PreparedStatement pmst_check = con.prepareStatement(sql);
				pmst_check.setInt(1, total);
				pmst_check.setString(2, temp);
				
				j = pmst_check.executeUpdate();
				pmst_check.close();
			  
			  
			  if(i!=0){
				  	out.print("<center><h1><br><br><br><br>删除成功！</h1></center>");
					out.print("<center><h1><br><br><br><br>将跳转回主界面......</h1></center>");
					response.setHeader("refresh", "3;URL=HomePage.jsp");
			  }else{
				  	out.print("<center><h1><br><br><br><br>发生错误！</h1></center>");
					out.print("<center><h1><br><br><br><br>将跳转回主界面......</h1></center>");
					response.setHeader("refresh", "3;URL=HomePage.jsp");
			  }
		}catch(Exception e){
			System.out.print(e);
			out.print("<center><h1><br><br><br><br>出现错误！</h1></center>");
			out.print("<center><h1><br><br><br><br>将跳转回主界面......</h1></center>");
			response.setHeader("refresh", "3;URL=HomePage.jsp");
		}
	
	
	
	%>
</body>
</html>