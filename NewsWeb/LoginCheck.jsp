<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>

<script language="javascript">
var times=6;
clock();
function clock()
{
   window.setTimeout('clock()',1000);
   times=times-1;
   time.innerHTML =times;
}
</script>


<head>
<meta charset="UTF-8">
<title>登录确认</title>
</head>
<body style="background:url(images/welcome2.jpg)">
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		int flag=0;
		
		try{
			
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
		
			con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");
		
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(" select * from users");
			
			flag=0;
			//0:未找到 1：密码正确 2：密码错误 3:服务器连接失败
			while(rs.next()){
				String idex=rs.getString("username");
				if(idex.equals(name)){
					String p=rs.getString("password");
					if(p.equals(pwd)){
						flag=1;
					}else{
						flag=2;
					}
					break;
				}
			}
		}catch(Exception e){
			flag=3;
		}
		
		out.print("<br><br><br><br><br><br><br><br><br><center><h1>");
		if(flag==0){
			out.print("未找到该用户<br><br>请重试");
			//response.sendRedirect("LoginPage.jsp");
			out.print("<br><br><br>页面将自动跳转</h1></center>");
			response.setHeader("refresh", "3;URL=LoginPage.jsp");
		}else if(flag==1){
			out.print("登录成功!");
			//用请求转发，地址栏不改变，保留转发前的地址
			request.getRequestDispatcher("Manager.jsp").forward(request, response);
			out.print("<br><br><br>页面将自动跳转</h1></center>");
		}else if(flag==2){
			out.print("用户名或密码错误<br><br>请重试");
			response.setHeader("refresh", "3;URL=LoginPage.jsp");
			out.print("<br><br><br>页面将自动跳转</h1></center>");
		}else if(flag==3){
			out.print("服务器连接失败");
			response.setHeader("refresh", "3;URL=LoginPage.jsp");
			out.print("<br><br><br>页面将自动跳转</h1></center>");
		}
		
		
	%>
	
</body>
</html>