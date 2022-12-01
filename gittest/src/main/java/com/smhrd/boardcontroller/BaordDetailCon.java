package com.smhrd.boardcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BaordDetailCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("boardDetailCon접속 완료");
		request.setCharacterEncoding("UTF-8");
		
		String board_num = request.getParameter("num");
		System.out.println("board_num :" + board_num);
		
		HttpSession session = request.getSession();
		session.setAttribute("board_num", board_num);
		
		
		response.sendRedirect("BoardDetail.jsp");
	}

}
