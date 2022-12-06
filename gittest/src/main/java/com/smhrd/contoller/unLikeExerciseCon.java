package com.smhrd.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;

public class unLikeExerciseCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		int type = (int) session.getAttribute("type");
		System.out.println("type : " + type);
		int id_num = (int) session.getAttribute("id_num");
		System.out.println("id_num : " + id_num);

		Member unlikeExercise = new Member(type, id_num);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.UnLikeExercise(unlikeExercise);
		if(cnt > 0) {
			System.out.println("좋아요삭제");
			
			PrintWriter out = response.getWriter();
			
			out.print(type);
			System.out.println("여기 출력 3");
		}
	
	}

}
