<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            
        }
        
    </style>
    
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.delete.pw.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
    
</head>
<body>
	<br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br>
 
    <form name="deleteform" method="post" action="main.jsp?contentPage=deletePro.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
        <input type="submit" value="탈퇴" /> 
    </form>
</body>
</html>