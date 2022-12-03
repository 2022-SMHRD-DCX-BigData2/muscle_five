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
		
		String id = request.getParameter("id");
		System.out.println("id :" + id);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.deleteUser(id);
				
		if(cnt > 0) {
			System.out.println("DeleteCon : 회원 삭제 성공!");
		} else {
			System.out.println("DeleteCon : 회원 삭제 실패..");
		}
		response.sendRedirect("userinfo.jsp");
	}

}
