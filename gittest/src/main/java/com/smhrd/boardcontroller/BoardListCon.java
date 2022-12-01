package com.smhrd.boardcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;



public class BoardListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
	    
	  
	    String page = request.getParameter("page");
	    
	    HttpSession session = request.getSession();
		session.setAttribute("page", page);
		response.sendRedirect("BoardList.jsp");
		
		System.out.println("page : " + page);
		
	}

}
