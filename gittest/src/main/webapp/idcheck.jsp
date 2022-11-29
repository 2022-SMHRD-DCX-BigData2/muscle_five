<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
<title>아이디 중복체크 화면</title>
	<script type="text/javascript">
		// 아이디 중복체크 완료처리
		function idValue(){
			if('<%=request.getAttribute("checkedId") %>' == "null"){
				document.getElementById('inputId').value = opener.document.userinfo.id.value;
			} else {
				document.getElementById('inputId').value = '<%=request.getAttribute("checkedId")%>';				
			}
			

		}
		
		function clickClose(){
			opener.document.userinfo.id.value = document.getElementById('inputId').value;
			window.open('','_self').close();
			self.close();
			window.close();
			window.opener = window.location.href;
			window.open('about:blank','_self').close();
			window.open('location', '_self', '');


			// 종료가 안돼.......
		}
	   
	 </script>
</head>
<body onload="idValue();">
	<div id="wrap">
	<br>

	<h2 align="center"><font size='6' color='black'>[아이디 중복확인]</font></h2>
		<form action="idCheck" method="post" name="userinfo">
	 		<table align="center">
	 			<tr>
	 				<td><font size="3" color="gray">아이디<input type="text" name="inputId" id="inputId"></font></td>
					<td><input type="submit" value="중복 확인"></td>
				</tr>
		
				<br>
				<tr>
					<td>
						<% 
							if(request.getAttribute("result") != null){
								int result = (int)request.getAttribute("result");
								if(result == 1){	
						%>
						 이미 사용 중인 아이디입니다.
						<%
							} else{
						%>
						 사용 가능한 아이디 입니다.
						 <td><input type="button" value="사용하기" onclick="clickClose();" id="closeWindow"></td>
						 
						<% 
								}				
							}
						%>
					</td>
				</tr>
				</form>
				
		</table>
	</div>
	
	<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	
</body>
</html>