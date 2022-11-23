<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>회원정보 수정처리</title>
</head>
<body>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	HttpSession session = request.getSession();
        // 세션에서 아이디를 가져와 Member에 세팅한다.
        String id= (String)session.getAttribute("sessionID"); 
        member.setId(id);
    
        // 수정할 회원정보를 담고있는 Member을 DAO로 전달하여 회원정보 수정을 한다.
        MemberDAO dao = MemberDAO.getInstance();
        dao.updateMember(member);
    %>
    
    <br><br>
    <font size="5" color="gray">회원정보가 수정되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="location.href='main.jsp'"/>
</body>
</html>