<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="creatHomePage.Home" %>
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
body{
	background:url(images/welcome2.jpg);
	background-attachment: fixed;
	background-repeat: repeat;
	background-size: 100% 100%;
}

.logo{
	position: absolute;
	width: 8vw;
	height: auto;
	left: 22vw;
	top: 2vw;
	/*半透明效果*/
	opacity: 0.6;
	filter: alpha(opacity=30);
	-moz-opacity:0.3;
	z-index: 5;
}
.logo img{
	width: 100%;
	height: 100%;
	border-radius: 50%;
}

/*.box{
	background:url(images/welcome.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
}
.box img{
	width: 100%;
	height: auto;
}
*/
.title{
	position: relative;
	top: 4vw;
	/*font-family: "verdana";*/
	font-family: "华文彩云";/*字体*/
	font-weight: bold;/*粗体*/
	font-size: 3vw;/*字号*/
}

.content{
	   color:Crimson;
	   margin:20px;
	   padding:20px;
}

.spring{
	position: relative;
	top: 2vw;
	font-weight: bold;
	font-size: 2.5vw;
	font-family: "宋体";
	text-indent: 2em;
}
.text{
	position: relative;
	top: 2vw;
	width: 77vw;
	line-height: 2.1vw;
	font-family: "楷体";
	font-size: 1.5vw;
/*	display:inline-block;*/
	text-indent: 2em;
}

.Administrator{
	right: 4vw;
	top: 2vh;
	position: absolute;
	font-size: 1.5vw;
	font-family: "仿宋";
}

a{
	text-decoration: none;/*去下划线*/
}

.news{
	top: 0vw;
	position: relative;	
	left: 9.8vw;
	width:80vw;
	border:1vw solid rgba(136,201,211,0.5);
	border-radius:20%;
/*	top: 100px;*/
}
.news>p{
	position:relative;
	left:8vw;
	font-weight: bold;
	font-size: 1.5vw;
	line-height: 2.1vw;
	font-family: "楷体";
}

.total{
	position: relative;
	bottom: -15vw;
	font-family: "宋体";
	font-weight: bold;
	font-size: 1.5vw;
	padding:2vw 16vw;
}

/*新闻列表*/
.list{
	position: relative;
	left: 2vw;
	top: 0.5vw;
	font-family: "楷体";
	width:25vw;
}
.list>b{
	font-size: 2vw;
}
.list>p{
	font-size: 1.5vw;
}


/*二级菜单*/
.us ul li{
	border: 1px solid rgba(0,0,0,0.4);/*定义边框线的大小和颜色*/
	border-radius: 50%;/*定义边框线的圆角大小*/
	width: 5vw;
	height: 5vw;
	display: block;
	list-style: none;
	float: right;
	background-color:rgba(230,217,198,0.5)
}
.us>ul>li{
	top: 10vh;
	right: 4vw;
	position: relative;
}
.us ul li ul{
	position:relative;
	display:none;
}/*定义二级菜单ul标签的相对位置*/
.us ul li ul li{
	height: 5vw;
	width: 5vw;
	display: block;
	background-color:rgba(255,255,224,0.3);
} /*定义二级菜单li标签的样式	*/	
.us a{
	width: 100%;
	height: 100%;
	display: block;
	text-align: center;
	line-height: 5vw;
	font-size:0.9vw;
	color: #e14b10;
	text-decoration: none;
	position:relative;
	z-index: 2;/*优先级别最高，二级菜单能显示*/
}/*定义a标签的样式*/
.us>ul>li:hover{
	background-color:rgba(255,240,245,0.5); 
}/*鼠标滑到一级菜单li标签时li标签背景颜色改变*/
.us>ul>li>ul>li:hover{
	background-color:rgba(53,59,68,0.5); 
}/*鼠标滑到二级菜单li标签时li标签背景颜色改变*/
.us>ul>li:hover ul{
	display: block;
}/*显示二级菜单，即修改二级菜单的diplay为block*/
.us>ul>li>a:hover{
	color: black;
}/*修改一级菜单a标签的字体颜色*/
.us>ul>li>ul>li>a:hover {
	color: white;
}/*修改二级菜单a标签的字体颜色*/	
	
	
.Bottom{
	position: relative;
	left: 0vw;
	top: 0.8vw;
	font-family: "楷体";
	font-size:1.6vw;
}	

</style>

<!-- 显示在浏览器标签中的内容 -->
<title>新闻网站--《测试中》</title>

</head>
<body>

	
   	<div class="Administrator">
   			<a href="LoginPage.jsp" target="_blank">管理员入口</a>
   	</div>
	<!-- 大标题 -->
	
	<div class="logo">
   		<a href="https://bbs.gxuacm.net/"><img src="images/logo.jpg"></a>
   	</div>
	
	<div class="us">
	<ul>
		<li><a>关于我们</a>
			<ul>
				<li><a href="AboutUs.jsp?id=1" target="_blank">许钊鸿</a></li>
				<li><a href="AboutUs.jsp?id=2" target="_blank">李广南</a></li>
				<li><a href="AboutUs.jsp?id=3" target="_blank">陈瑶</a></li>
			</ul>
		</li>
	</ul>


</div>
	
	<br>
	<div class="title" align="center">
		新闻网站--《测试中》
	</div>
	
	<!-- 使用div -->
	<div class="content">
		<p class="spring">春节</p>
		<p class="text">春节，即农历新年，是一年之岁首、传统意义上的年节。俗称新春、新年、新岁、岁旦、年禧、大年等，口头上又称度岁、庆岁、过年、过大年。春节历史悠久，由上古时代岁首祈年祭祀演变而来。</p>
		<p class="text">万物本乎天、人本乎祖，祈年祭祀、敬天法祖，报本反始也。春节的起源蕴含着深邃的文化内涵，在传承发展中承载了丰厚的历史文化底蕴。</p>
	</div> 
	
	<!-- <a href="http://www.w3school.com.cn/（跳转到的地址）" target="_blank">连接的文本</a> 跳转到空白页面打开连接的方法  插入到body中 -->
<% 
	try {  
		//进入网页时先获取目标页码
		String targetPageS = request.getParameter("page"); 
		
		//将目标页码转为整形数字
		System.out.println(targetPageS);
		int targetPage=0;
		if(targetPageS==null){
			targetPage=1;
		}else{
			targetPage=Integer.parseInt(targetPageS);
		}
		System.out.println(targetPage);
		
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");

		con= DriverManager.getConnection("jdbc:mysql://121.36.1.81:3306/newsweb?serverTimezone=GMT%2B8&useSSL=false", "ziran","123456");

		//为了获取用户访问的时间
		Date date = new Date();//获得系统时间.
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String nowTime = sdf.format(date);//将时间格式转换成符合Timestamp要求的格式.
		 
		 System.out.println("用户访问主页成功连接！："+nowTime);

		Statement st = con.createStatement();
		
		ResultSet rsex = st.executeQuery(" select * from check_table");
		
		//获取total值 每一页显示条数的flag值
		int total=0;
		int flag=0;
		rsex.next();
			total=rsex.getInt("total");	
			flag=rsex.getInt("flag");
		rsex.close();
		
		//初始化flag，保证flag不为空
		if(flag==0){
			flag=10;
		}
		
		//算出总页数,要在除数结果的基础上加1
		int totalPage=((total-1)/flag)+1;
		
		//确保target合法，非法数值转换为1让其访问首页
		if(targetPage>totalPage||targetPage<1){
			targetPage=1;
		}
		
		ResultSet rs = st.executeQuery(" select * from articles");
		
	    if(con != null){  
	        //out.print("服务器连接成功！<br />");          
  
	        out.print("<div class=\"list\"><b>新闻列表：共"+total+"篇文章</b>"); 
	        out.print("<br><b>当前页码: 第"+targetPage+"页/共"+totalPage+"页</b>");
	        out.print("</div>");
	        //out.print("<font size=\"5\" ><b>共"+total+"篇文章</b></font>"); 
	        out.print("<br />");  
	        int counter=0;
	        
	        out.print("<div class=\"news\">");
	        
	        while (rs.next()) {  
	        	counter++;
	        	int id=rs.getInt("id");
	        	if(counter>=(targetPage-1)*flag+1&&counter<=targetPage*flag){	
		        	//out.print("<center><p><font face=\"楷体\" size=\"5\">");
		        	out.print("<p>");
		        	out.print("<a href=\"ShowPage.jsp?id="+id+" \"target=\"_blank\">");
		        	out.print(rs.getString("title")+"——<i>"+rs.getString("little_title")+"</i>"); //将查询结果输出
		        	out.print("</a></p>");
		        	//out.print("</a><br />"); 
		        	//out.print("</font></p></center>");
	        	}
	        	if(counter>targetPage*flag){
	        		break;
	        	}
	        	
	   		}
	        if(counter==0){
	        	out.print("<h2>没有找到文章！</h2></br>");
	        }
	        out.print("</div>");
	        
	        
	        out.print("<div class=\"Bottom\">");
	        %>
	        <center><p>
	        
	        <a href="HomePage.jsp?page=1">返回首页</a>
	        <%
	        
	        if(targetPage!=1){
	        	out.print("&emsp;&emsp;");
	        	out.print("<a href=\"HomePage.jsp?page="+(targetPage-1)+" \">上一页</a> ");//返回上一页
	        }
	        
	        if(targetPage!=totalPage){
	        	out.print("&emsp;&emsp;");
		        out.print("<a href=\"HomePage.jsp?page="+(targetPage+1)+" \">下一页</a>");//返回下一页
	        }
	        
	        %>
	        &emsp;&emsp;
	        <a href="HomePage.jsp?page=<%=totalPage %>">到最底页</a>
	        <%
	        
	        out.print("</p></center>");
	        
	        %>
	        <center>
	        	<form action="HomePage.jsp" method="get">
	        		<input type="text" value="<%=targetPage %>" name="page"  style="width:3vw; height:2vw;font-size:1.3vw;"/>
	        		<input type="submit" value="跳转"  style="width:3vw;height:2vw;font-size:1.1vw;"/>
	        	</form>
	        </center>
	        <%
	        
	        
	        
	        out.print("</div>");
	        
	        
	        rs.close();
	        out.print("<br><br><br><br>");
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