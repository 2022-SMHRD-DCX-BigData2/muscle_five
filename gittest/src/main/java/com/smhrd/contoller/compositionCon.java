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
		
		// if문 써서 c형 i형 d형 구분하고
		// 여기서 또 팔굽이랑 턱걸이로 타입을 구분(1, 2, 3, 4, ...... 9)하고
		// update문으로 user_info에 타입을 지정
		// 옛날에 저장해둔 값을 계속 볼 수 있게 한다(prev next)누르면 type이 계속 바뀌도록한다.....
		// 모달창으로 할 수도 있으니깐 c i d 변수 저장???
		// sql 생각하기..
		int userType = 0;
		if(weight * 0.4 > muscle) {
			if(pushup < 5) {
				userType = 1;
			}else if(pushup < 10){
				userType = 2;
			}else {
				userType = 3;
			}
		}else if(weight * 0.5 < muscle) {
			if(pushup < 50) {
				userType = 7;
			}else if(pushup < 60) {
				userType = 8;
			}else {
				userType = 9;
			}
		}else {
			if(pushup < 20) {
				userType = 4;
			}else if(pushup < 30) {
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
