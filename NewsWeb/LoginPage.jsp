<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/math.css">

<title>管理员入口</title>
</head>
<body style="background:url(images/welcome2.jpg)">

	<p align="left" ><font size="5" face="仿宋"  color=""><br>&emsp;&emsp;&emsp;&emsp;<a href="HomePage.jsp" >返回</a></font></p>

	</br></br></br></br></br>
	<center><font face="华文楷体" size="7" color=""><b>管理员入口</b></font></center>
	</br></br></br>
	<center><font face="宋体" size="5" color=""><b><i>请输入账号密码登录</i></b></font></center>
	</br>
	<center>
			<form action="LoginCheck.jsp" name="" method="post">
				<table>
					<tr><td align=left><b>会员名称：</b></td><td><input type=text name="username"></td></tr>
					<tr><td align=left><b>输入密码：</b></td><td><input type=password name="password"></td></tr>				
				</table>								
				<br><input type="submit" value="提交">
			</form>
	</center>
</body>
</html>