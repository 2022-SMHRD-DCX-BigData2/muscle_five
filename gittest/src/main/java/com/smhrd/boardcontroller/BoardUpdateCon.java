package com.smhrd.boardcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BoardUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String board_num = request.getParameter("num");
		HttpSession session = request.getSession();
		session.setAttribute("updateBoardNum", board_num);
		
		response.sendRedirect("BoardWrite.jsp");
		
	}

}
