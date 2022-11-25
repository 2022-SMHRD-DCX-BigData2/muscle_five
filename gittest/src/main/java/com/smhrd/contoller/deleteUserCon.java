package com.smhrd.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.MemberDAO;


public class deleteUserCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		System.out.println("[DeleteUserCon]");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		// id 파라미터 수집
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// DAO에 일할 메소드 만들기
		MemberDAO dao = new MemberDAO();
		int cnt = dao.deleteUser(id, pw);
				
		// DAO의 명령 후 처리
		// 성공했으면(cnt>0) -> 성공페이지로 이동!
		if(cnt > 0) {
			System.out.println("DeleteUserCon : 회원 탈퇴 성공!!");
			session.invalidate();
		} else {
			System.out.println("DeleteUserCon : 회원 탈퇴 실패..");
		}
		// 다시 main.jsp로 이동.
		response.sendRedirect("main.jsp");
	}

}
