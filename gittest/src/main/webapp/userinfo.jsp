<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 회원정보 출력화면</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	<style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
        }
    </style>
    <script type="text/javascript">
    
        function change(val){
            if(val == "-1"){
                location.href="main.jsp";
            }else if(val == "0"){
                location.href="main.jsp?contentPage=modify.jsp";
            }else if(val == "1"){
                location.href="main.jsp?contentPage=delete.jsp";
            }
        }
        
    </script>
</head>
<body>
	<%
        String id = session.getAttribute("sessionID").toString();
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDAO dao = MemberDAO.getInstance();
        Member member = dao.getUserinfo(id);
    %>
 
        <br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=member.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=member.getPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=member.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td><%=member.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
                    <%=member.getBirthyy() %>년 
                    <%=member.getBirthmm() %>월 
                    <%=member.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=member.getMail1() %>@
                    <%=member.getMail2() %>
                </td>
            </tr>
           
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="change(-1)">
        <input type="button" value="회원정보 변경" onclick="change(0)">
        <input type="button" value="회원탈퇴" onclick="change(1)">
</body>
</html>