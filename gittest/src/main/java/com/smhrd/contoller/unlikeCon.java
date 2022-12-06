package com.smhrd.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.MemberDAO;

public class unlikeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("여기출력");
		int type = Integer.parseInt(request.getParameter("type").toString()); 
		System.out.println("type : " + type);
		int id_num = Integer.parseInt(request.getParameter("id_num").toString());
		System.out.println("id_num : " + id_num);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.unlikeCnt(type);
		
		if(cnt > 0) {
			System.out.println("unlikeCon에서 unlikeexercisecon으로 이동");
			HttpSession session = request.getSession();
			session.setAttribute("type", type);
			session.setAttribute("id_num", id_num);
			response.sendRedirect("unLikeExerciseCon");
			
			
		}
		
		

	}

}
