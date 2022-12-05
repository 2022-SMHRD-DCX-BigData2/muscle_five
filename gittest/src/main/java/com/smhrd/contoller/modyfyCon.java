package com.smhrd.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;


public class modyfyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[modifyCon]");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		String pw = request.getParameter("pw");
        String gender = request.getParameter("gender");
        String birth_yy = request.getParameter("birth_yy");
        String birth_mm = request.getParameter("birth_mm");
        String birth_dd = request.getParameter("birth_dd");
        String mail1 = request.getParameter("mail1");
        String mail2 = request.getParameter("mail2");
        String email = mail1 + "@" + mail2;
        String birth = birth_yy + "/" + birth_mm + "/" + birth_dd;
        
        Member update = new Member(id, pw, gender, birth, email);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.updateMember(update);
		
		if(cnt > 0) {
			System.out.println("modifyCon : 회원정보 수정 성공!");
			session.setAttribute("loginMember", update);
			
			response.sendRedirect("main.jsp");
			
		} else {
			System.out.println("modifyCon : 회원정보 수정 실패..");

			response.sendRedirect("main.jsp");

		}
	}

}
