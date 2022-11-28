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
		
		// 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("UTF-8"); 
        
        // getParameter()를 이용해 넘겨진 파라미터 값을 얻어올 수 있다.
        // 파라미터 값을 얻을때 name= 에 지정해둔 값과 동일한 값을 인자로 지정해야 된다.
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        // 성별의 경우, 파라미터 이름이 둘다 gender로 동일하므로 배열로 받아야 된다.
        String gender = request.getParameter("gender");	
        String birth_yy = request.getParameter("birth_yy");
        
        // 생일의 경우 <select>로 되어 있는데 파라미터 값을 받을 시 배열형태로 넘겨 받는다.
        String birth_mm = request.getParameter("birth_mm");
        	
        String birth_dd = request.getParameter("birth_dd");
        String mail1 = request.getParameter("mail_1");
        
        // 이메일의 경우 <select>로 되어 있는데 파라미터 값을 받을 시 배열형태로 넘겨 받는다.
        String mail2 = request.getParameter("mail_2");
        
        		
        	
        Member joinMember = new Member(id, pw, gender, birth_yy, birth_dd, birth_mm, mail1, mail2);
        	
        MemberDAO dao = new MemberDAO();
		int cnt = dao.insertMember(joinMember);
		
		if(cnt > 0) {
			System.out.println("JoinCon : 회원가입 성공!");
			// 회원가입 성공하면 joinSuccess.jsp로 이동.
	        
			// response.sendRedirect("joinSuccess.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("joinsuccess.jsp");
			request.setAttribute("joinid", id);
			rd.forward(request, response);
			
			// 실패했으면 -> 이동X
		} else {
			System.out.println("JoinCon : 회원가입 실패..");
			// 회원가입 실패하면 main.jsp로 이동.
			response.sendRedirect("main.jsp");
		}
		
	}

}
