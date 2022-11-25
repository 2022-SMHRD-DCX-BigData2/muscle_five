package com.smhrd.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;
import com.smhrd.domain.compositionMember;


public class compositionCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("UTF-8"); 
        
        HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		String weight = request.getParameter("weight");
		String muscle = request.getParameter("muscle");
		String fat =  request.getParameter("fat");
        System.out.println(id);
        	
        compositionMember joinMember = new compositionMember(id, weight, muscle, fat);
        	
        MemberDAO dao = new MemberDAO();
		int cnt = dao.insertCom(joinMember);
		
		if(cnt > 0) {
			System.out.println("compositionCon : success");
			// 회원가입 성공하면 joinSuccess.jsp로 이동.
	        
			// response.sendRedirect("joinSuccess.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("routin.jsp");
			rd.forward(request, response);
			
			// 실패했으면 -> 이동X
		} else {
			System.out.println("compositionCon : fail....");
			// 회원가입 실패하면 main.jsp로 이동.
			response.sendRedirect("main.jsp");
		}
	}

}
