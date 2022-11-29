package com.smhrd.calendarcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.calendardomain.Calendar;
import com.smhrd.calendardomain.CalendarDAO;

public class CalendarUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.err.println("[CalendarUpdateCon]");
		// 값 가져오기 전에 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// ajax에서 보내온 값을 form태그의 name속성으로 보낸것 같이
		// getparameter해줌
		String json = request.getParameter("json");
		
		System.out.println(json);

		Gson gson = new Gson();
		
		// Gson에 있는 fromJson(json데이터, 저장할 변수의 클래스 정보)
		// 가져온 json 데이터를 캘린더 객체로 생성
		Calendar[] calendar = gson.fromJson(json, Calendar[].class);
		Calendar updateCalendar = calendar[0];
		
		
		CalendarDAO dao = new CalendarDAO();
		int cnt = dao.updateCalendar(updateCalendar);
		
		
		if (cnt > 0) {
			System.out.println("캘린더 일정 수정 성공");
		} else {
			System.out.println("캘린더 일정 수정 실패");
		}

		
	}

}

