package com.smhrd.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;


public class loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); 
        
        // 로그인 화면에 입력된 아이디, 비밀번호 가져오기
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
    	// Member 객체에 담아주기
        Member joinMember = new Member(id,pw);
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao =  new MemberDAO();
        Member loginMember = dao.selectMember(joinMember);
        //int check = dao.loginCheck(id, pw);
        
        // URL 및 로그인 관련 전달 메시지
        String msg = "";
        
        if(loginMember != null) {
	        //if(check == 1) {  // 로그인 성공
	            // 세션에 현재 아이디 세팅
	            HttpSession session = request.getSession();
	            session.setAttribute("loginMember", loginMember);
	            msg = "main.jsp";
	     	//}  
        } else {
        	//if(check == 0) {// 비밀번호가 틀릴 경우
	        //    msg = "login.jsp?msg=0";
	        //} else {   // 아이디가 틀릴 경우
	        //    msg = "login.jsp?msg=-1";
	        //}
        	System.out.println("로그인 실패...");
        }
        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect("main.jsp");
	}

}
