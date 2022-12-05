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
        
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        System.out.println("id : "+ id);
        System.out.println("pw : "+ pw);
        
        Member joinMember = new Member(id,pw);
        
        MemberDAO dao =  new MemberDAO();
        Member loginMember = dao.selectMember(joinMember);
        
        String msg = "";
        
        if(loginMember != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginMember", loginMember);
            
            response.sendRedirect("main.jsp");
           
        } else {
        	
        	msg = "faile";
        	System.out.println("로그인 실패...");
        	response.sendRedirect("login.jsp?msg="+msg);
        	
        }
        
        
	}
}
