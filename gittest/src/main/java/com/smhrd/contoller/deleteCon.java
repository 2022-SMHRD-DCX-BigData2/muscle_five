package com.smhrd.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.MemberDAO;


public class deleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[DeleteCon]");
		
		request.setCharacterEncoding("UTF-8");
		
		// email 파라미터 수집
		String id = request.getParameter("id");
		
		// DAO에 일할 메소드 만들기
		MemberDAO dao = new MemberDAO();
		int cnt = dao.deleteMember(id);
				
		// DAO의 명령 후 처리
		// 성공했으면(cnt>0) -> 성공페이지로 이동!
		if(cnt > 0) {
			System.out.println("DeleteCon : 회원 삭제 성공!");
		} else {
			System.out.println("DeleteCon : 회원 삭제 실패..");
		}
		// 다시 select.jsp로 이동.
		response.sendRedirect("login.jsp");
	}

}
