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


public class usergradeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 어떤 사람의 회원정보를 수정할지 id을 가져와야함
		// 세션에서 정보 가져오기
		HttpSession session = request.getSession();
		//Member userMember = (Member) session.getAttribute("selectOne");
	
		// 1. 파라미터 수집
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		System.out.println(id);
		System.out.println(grade);
		
		// 받아온 데이터를 Member 객체에 담아주기
        Member userMember = new Member(id, grade);
		
		// DAO에 일할 메소드 만들기.
		MemberDAO dao = new MemberDAO();
		int cnt = dao.updateGrade(userMember);
		//Member userMember = dao.selectMember(joinMember);
		
		// DAO의 명령 후 처리
		// 성공했으면(cnt>0) -> 성공페이지로 이동!
		if(cnt > 0) {
			System.out.println("usergradeCon : 회원등급 변경 성공!");
			// 세션에 저장되어있는 정보가 수정되기 이전의 로그인 정보이기 때믄에
			// 같은 이름으로 덮어쓰기 해야한다.
			session.setAttribute("selectOne", userMember);
			RequestDispatcher rd = request.getRequestDispatcher("userinfo.jsp");
			rd.forward(request, response);
			response.sendRedirect("userinfo.jsp");
			//response.sendRedirect("userinfo.jsp");
			
			// 실패했으면 -> 이동X
		} else {
			System.out.println("usergradeCon : 회원등급 변경 실패..");
			// 회원가입 실패하면 main.jsp로 이동.

			//response.sendRedirect("updategrade.jsp");

		}
	}

}
