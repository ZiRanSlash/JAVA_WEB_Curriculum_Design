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
	<style type="text/css">
		*{
	margin: 0;
	padding: 0;
}

a{
	text-decoration: none;
}


body{
	background: url(images/welcome2.jpg);
	background-attachment:fixed;
	background-repeat:repeat;
	background-size:100% 100%;
}

.home{
	position: absolute;
	top: 1vw;
	left: 20vw;
	height: 2vw;
	width: 6vw;
	border-radius: 20%;
	background-color: rgba(0,0,0,0.2);
	border: 1px solid rgba(0,0,0,0.4);/*定义边框线的大小和颜色*/
}
.home>p{
	color: red;
	font-size: 1.4vw;
	font-family: "楷体";
}

.p1{
	font-size: 2.8vw;
	font-weight: bold;
	font-family: "宋体";
	margin-top:3vw;
}
.p2{
	font-size: 2.5vw;
	font-weight: bold;
	font-family: "宋体";
	margin-top:1vw;
}
.p3{
	font-size: 1.8vw;
	font-weight: bold;
	font-family: "仿宋";
}

.content{
    /*background-color:white;*/
    background-color: rgba(255,255,255,0.5);
    width: 60vw;
    height: auto;
	top:2vh;
	bottom: 2vh;
    position:relative;
    left:20vw;
    border: 2px solid black;
	border-radius:25px;

    text-indent: 2em;
	font-size: 1.1vw;
	font-family: "宋体";
	line-height: 1.5vw;
}

.id{
	position: absolute;
	left: 1vw;
	top: 1vh;
	font-family: "楷体";
	font-size: 2vw;
}


.border{
	position: relative;
	height: 5vh;
}
		
	</style>
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
		out.print("<body>"); 
		%>
		<a href="HomePage.jsp">
			<div class="home" align="center">
				<p>首页</p>
			</div>
		</a>
		<%
		if(flag==1){
			//标题内容和作者日期
			out.print("</br></br><center><p class=\"p1\">"+rs.getString("title")+"</p></center>");
			out.print("<center><p class=\"p2\">——<i>"+rs.getString("little_title")+"</i></p></center>");
			out.print("</br><center><p class=\"p3\">作者："+rs.getString("author")+"&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;日期："+rs.getString("date")+"</p></center>");
			
			
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