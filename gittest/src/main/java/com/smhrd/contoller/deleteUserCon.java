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
		
		// email 파라미터 수집
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		String pw = request.getParameter("pw");
		System.out.println(id);
		System.out.println(pw);
		// DAO에 일할 메소드 만들기
		Member deletemember = new Member(id, pw);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.deleteUserMember(deletemember);
				
		// DAO의 명령 후 처리
		// 성공했으면(cnt>0) -> 성공페이지로 이동!
		if(cnt > 0) {
			System.out.println("DeleteCon : 회원 삭제 성공!");
			session.invalidate(); // 모든세션정보 삭제
	        response.sendRedirect("login.jsp"); // 로그인 화면으로 다시 돌아감
		} else {
			System.out.println("DeleteCon : 회원 삭제 실패..");
			response.sendRedirect("main.jsp");
		}
		// 다시 select.jsp로 이동.
		
	}

}

