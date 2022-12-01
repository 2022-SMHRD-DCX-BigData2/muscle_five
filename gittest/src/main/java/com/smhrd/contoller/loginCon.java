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
        System.out.println("id : "+id);
        System.out.println("pw : "+pw);
        
    	// Member 객체에 담아주기
        Member joinMember = new Member(id,pw);
        
        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao =  new MemberDAO();
        Member loginMember = dao.selectMember(joinMember);
        
        String msg = "";
        
        if(loginMember != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginMember", loginMember);
            
            // sendRedirect(String URL) : 해당 URL로 이동
            // URL뒤에 get방식 처럼 데이터를 전달가능
            response.sendRedirect("main.jsp");
           
        } else {
        	
        	msg = "faile";
        	System.out.println("로그인 실패...");
        	response.sendRedirect("login.jsp?msg="+msg);
        	
        }
        
        
	}
}
