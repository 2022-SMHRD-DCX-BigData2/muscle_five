package com.smhrd.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;


public class joinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("UTF-8"); 
        
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String gender = request.getParameter("gender");	
        String birth_yy = request.getParameter("birth_yy");
        String birth_mm = request.getParameter("birth_mm");
        String birth_dd = request.getParameter("birth_dd");
        String mail1 = request.getParameter("mail1");
        String mail2 = request.getParameter("mail2");
        String grade = request.getParameter("grade");
        String email = mail1 + "@" + mail2;
        String birth = birth_yy + "/" + birth_mm + "/" + birth_dd;
        
        Member joinMember = new Member(id, pw, gender, birth, email, grade);
        	
        MemberDAO dao = new MemberDAO();
		int cnt = dao.insertMember(joinMember);
		
		if(cnt > 0) {
			System.out.println("JoinCon : 회원가입 성공!");
			RequestDispatcher rd = request.getRequestDispatcher("joinsuccess.jsp");
			request.setAttribute("joinid", id);
			rd.forward(request, response);
		} else {
			System.out.println("JoinCon : 회원가입 실패..");
			response.sendRedirect("main.jsp");
		}
		
	}

}
