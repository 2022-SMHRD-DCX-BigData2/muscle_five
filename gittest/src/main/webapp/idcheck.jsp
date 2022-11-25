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
	    function idok(){
	     	opener.userinfo.id.value = document.userinfo.id.value;
	   	 	opener.userinfo.reid.value = document.userinfo.id.value;
	    	self.close();
	   	}
	 </script>
</head>
<body>
	<div id="wrap">
	<br>
	<h2 align="center"><font size="6" color ="black" >[아이디 중복확인]</font></h2>
	<form action="idCheck" method="post" name="userinfo">
	 	<table align="center">
	 		<tr>
	 			<td><font size="5" color="gray">아이디</font></td>
	 		</tr>	
	 		<tr>
	 			<td><input type="text" name="id" value="${id}"></td>
				<td><input type="submit" value="중복 확인"></td>
			</tr>
	
			<br>
		
			<tr>
				<td>
				<c:if test="${result == 1}">
					<script type="text/javascript">
						opener.document.userinfo.id.value]="";
					</script>
					<font size="2" color="gray">${id}는 이미 사용 중인 아이디 입니다.</font>
				</c:if>
				<c:if test="${result == -1}">
					<font size="2" color="gray">${id}는 사용 가능한 아이디 입니다.</font>
				</td>	
					<td><input type="button" value="사용허기" class="cancel" onclick="idok()"></td>
				</c:if>
			<tr>
			
		</table>
	</form>
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