package com.smhrd.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;


public class deleteUserCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[DeleteCon]");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		String pw = request.getParameter("pw");
		System.out.println(id);
		System.out.println(pw);
		
		Member deletemember = new Member(id, pw);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.deleteUserMember(deletemember);
				
		if(cnt > 0) {
			System.out.println("DeleteCon : 회원 삭제 성공!");
			session.invalidate();
	        response.sendRedirect("login.jsp"); 
		} else {
			System.out.println("DeleteCon : 회원 삭제 실패..");
			response.sendRedirect("main.jsp");
		}
		
	}

}

