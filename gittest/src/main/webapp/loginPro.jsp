<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
        // 인코딩 처리
        request.setCharacterEncoding("UTP-8"); 
        
        // 로그인 화면에 입력된 아이디, 비밀번호 가져오기
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
    	// Member 객체에 담아주기
        Member login = new Member(id,pw);
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        Member loginMember = dao.selectMember(login);
        int check = dao.loginCheck(id, pw);
        
        // URL 및 로그인관련 전달 메시지
        String msg = "";
        
        if(loginMember != null) {
	        if(check == 1) {  // 로그인 성공\
	            // 세션에 현재 아이디 세팅
	            HttpSession session = request.getSession();
	            session.setAttribute("sessionID", loginMember);
	            msg = "main.jsp";
	            
	        } else if(check == 0) {// 비밀번호가 틀릴 경우
	            msg = "login.jsp?msg=0";
	        } else {   // 아이디가 틀릴 경우
	            msg = "login.jsp?msg=-1";
	        }
        }
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    %>
</body>
</html>