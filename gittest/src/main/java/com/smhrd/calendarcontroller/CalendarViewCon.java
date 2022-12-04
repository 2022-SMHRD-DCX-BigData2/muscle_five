package com.smhrd.calendarcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.calendardomain.Calendar;
import com.smhrd.calendardomain.CalendarDAO;
import com.smhrd.domain.Member;

public class CalendarViewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.err.println("[CalendarViewCon]");
		
		CalendarDAO dao = new CalendarDAO();
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		System.out.println(loginMember.getId_num());
		
		
		List<Calendar> calendarList = dao.selectAll(loginMember);
		
		// Gson 객체 생성
		Gson gson = new Gson();
		
		// 자바코드에서 만들어낸 리스트를 json 문자열로 바꿈
		// Gson에 있는 toJson()
		String json = gson.toJson(calendarList);
		
		// 보내기 전에 인코딩
		response.setCharacterEncoding("UTF-8");
		
		// 보내는 통로 출력스트림 PrintWriter 객체 생성
		PrintWriter out = response.getWriter();
		
		// 결과값을 보내는 out.print();
		System.out.println("캘린더로 보내줄 Jon객체 확인 : " + json);
		
		// 전송
		out.print(json);

			
		
		
				
	}

}
