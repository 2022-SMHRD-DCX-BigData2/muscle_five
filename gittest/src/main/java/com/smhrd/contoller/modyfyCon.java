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
		// 어떤 사람의 회원정보를 수정할지 email을 가져와야함
		// 세션에서 정보 가져오기
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		// 1. 파라미터 수집
		
		
		String pw = request.getParameter("pw");
        String gender = request.getParameter("gender");
        	
        String birth_yy = request.getParameter("birth_yy");
        String birth_mm = request.getParameter("birth_mm");
        	
        String birth_dd = request.getParameter("birth_dd");
        //String birth = birth_yy + birth_mm + birth_dd;
        String mail1 = request.getParameter("mail1");
        String mail2 = request.getParameter("mail2");
        System.out.println("id : " + id);
       
        //String email = mail1 + "@" + mail2;
		
		// 받아온 데이터를 Member 객체에 담아주기
        Member update = new Member(id, pw, gender, birth_yy, birth_mm, birth_dd, mail1, mail2);
		
		// DAO에 일할 메소드 만들기
		MemberDAO dao = new MemberDAO();
		int cnt = dao.updateMember(update);
		
		// DAO의 명령 후 처리
		// 성공했으면(cnt>0) -> 성공페이지로 이동!
		if(cnt > 0) {
			System.out.println("modifyCon : 회원정보 수정 성공!");
			// 세션에 저장되어있는 정보가 수정되기 이전의 로그인 정보이기 때믄에
			// 같은 이름으로 덮어쓰기 해야한다.
			session.setAttribute("loginMember", update);
			
			response.sendRedirect("main.jsp");
			
			// 실패했으면 -> 이동X
		} else {
			System.out.println("modifyCon : 회원정보 수정 실패..");
			// 회원가입 실패하면 main.jsp로 이동.

			response.sendRedirect("main.jsp");

		}
	}

}
