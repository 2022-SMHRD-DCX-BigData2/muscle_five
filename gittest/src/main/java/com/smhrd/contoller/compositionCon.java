package com.smhrd.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
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
		int id_num = loginMember.getId_num();
		System.out.println("id_num : " + id_num);
		int weight = Integer.parseInt(request.getParameter("weight"));
		System.out.println("weight : " + weight);
		int muscle = Integer.parseInt(request.getParameter("muscle"));
		System.out.println("muscle : " + muscle);
		int fat = Integer.parseInt(request.getParameter("fat"));
		System.out.println("fat : " + fat);
		int weeks = Integer.parseInt(request.getParameter("weeks"));
		System.out.println("weeks : " + weeks);
		int pushup = Integer.parseInt(request.getParameter("pushup"));
		System.out.println("pushup : " + pushup);
		int pullup = Integer.parseInt(request.getParameter("pullup"));
		System.out.println("pullup : " + pullup);
		
		
		int userType = 0;
		if(weight * 0.42 > muscle) {
			if(pushup < 10) {
				userType = 1;
			}else if(pushup < 15){
				userType = 2;
			}else {
				userType = 3;
			}
		}else if(weight * 0.45 < muscle) {
			if(pushup < 80) {
				userType = 7;
			}else if(pushup < 90) {
				userType = 8;
			}else {
				userType = 9;
			}
		}else {
			if(pushup < 30) {
				userType = 4;
			}else if(pushup < 35) {
				userType = 5;
			}else {
				userType = 6;
			}
		}
		
        compositionMember joinMember = new compositionMember(id_num, weight, muscle, fat, weeks, pushup, pullup, userType);
        	
        MemberDAO dao = new MemberDAO();
		int cnt = dao.insertCom(joinMember);
		
		
		if(cnt > 0) {
			System.out.println("compositionCon : success");
			
			Gson gson = new Gson();
			String json = gson.toJson(joinMember);
			
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print(json);
			
			

			
		} else {
			System.out.println("compositionCon : fail....");
			response.sendRedirect("main.jsp");
		}
	}

}
