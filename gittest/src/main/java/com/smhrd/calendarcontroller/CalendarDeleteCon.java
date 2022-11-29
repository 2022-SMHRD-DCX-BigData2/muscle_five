package com.smhrd.calendarcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.calendardomain.CalendarDAO;

public class CalendarDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.err.println("[CalendarDeleteCon]");
		// 값 가져오기 전에 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// ajax에서 보내온 값을 form태그의 name속성으로 보낸것 같이
		// getparameter해줌
		String id = request.getParameter("json");
		
		System.out.println("삭제할 id : "+ id);
		
		CalendarDAO dao = new CalendarDAO();
		int cnt = dao.deleteCalendar(id);
		
		if (cnt > 0) {
			System.out.println("일정삭제 성공");
		} else {
			System.out.println("일정삭제 실패");
		}
		

	}

}
