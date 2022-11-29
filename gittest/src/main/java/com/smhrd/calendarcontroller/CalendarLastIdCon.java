package com.smhrd.calendarcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.calendardomain.CalendarDAO;

public class CalendarLastIdCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.err.println("[CalendarLastIdCon]");
	
		CalendarDAO dao = new CalendarDAO();
		
		String calendarLastId = dao.selectLastId(); 
		
		Gson gson = new Gson();
		
		String json = gson.toJson(calendarLastId);
		
		// 보내기 전에 인코딩
		response.setCharacterEncoding("UTF-8");
		
		// 보내는 통로 출력스트림 PrintWriter 객체 생성
		PrintWriter out = response.getWriter();
		
		// 달력으로 보내줄 마지막 ID 확인
		System.out.println("달력으로 보내줄 마지막 ID 확인 : " + json);
		
		out.print(json);

	}

}
