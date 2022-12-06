package com.smhrd.boardcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.boarddomain.Member_Board;


public class BoardUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("num").toString());
		String board_title = request.getParameter("title");
		String board_content = request.getParameter("content");
		
		Member_Board updateMember = new Member_Board(board_num, board_title, board_content);
		HttpSession session = request.getSession();
		session.setAttribute("updateBoardNum", updateMember);
		
		response.sendRedirect("BoardWrite.jsp");
		
	}

}
