package com.smhrd.boardcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;

public class searchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String wantSearch = request.getParameter("opt");
		String content = request.getParameter("condition");
		BoardDAO dao = new BoardDAO();
		
		
		if(wantSearch.equals("제목")) {
			List<Member_Board> title = dao.searchTitle(content);
			if(title != null) {
				System.out.println("타이틀 가져오기 대성공ㅎㅎ...");
				
			}
		} else if(wantSearch.equals("내용")) {
			/* int cnt = dao.searchContent(content); */
		} else {
			/* int cnt = dao.searchWriter(content); */
		}
	
	}

}
