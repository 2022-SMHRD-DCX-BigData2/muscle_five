package com.smhrd.boardcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;

public class searchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String wantContent = request.getParameter("opt");
		String condition = request.getParameter("condition");
		BoardDAO dao = new BoardDAO();
		System.out.println("wantSearch : " + wantContent);
		System.out.println("content : " + condition);
		
		HttpSession session = request.getSession();
		
		if(wantContent.equals("1")) {
			List<Member_Board> title = dao.searchTitle(condition);
			if(title != null) {
				System.out.println("con : 제목찾기 성공");
				RequestDispatcher rd = request.getRequestDispatcher("BoardList.jsp");
				rd.forward(request, response);
				
			}
		} else if(wantContent.equals("2")) {
			/* int cnt = dao.searchContent(content); */
		} else {
			/* int cnt = dao.searchWriter(content); */
		}
	
	}

}
