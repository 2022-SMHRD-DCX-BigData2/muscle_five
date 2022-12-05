package com.smhrd.boardcontroller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
		
		// 선택사항(제목 / 내용 / 작성자)
		String wantContent = request.getParameter("opt");
		System.out.println("선택 : " + wantContent);
		
		// 사용자가 입력한 내용
		String searchContent = request.getParameter("condition");
		System.out.println("내용 : " + searchContent);
		
		Member_Board memberBoardSearch = new Member_Board(searchContent);
		BoardDAO dao = new BoardDAO();
		
		// 가변길이리스트 생성
		List<Member_Board> wantList = new ArrayList<Member_Board>();
		HttpSession session = request.getSession();
		
		// 선택사항(제목)
		if(wantContent.equals("title")) {
			wantList = dao.searchTitle(memberBoardSearch);
			session.setAttribute("titleList", wantList);
			response.sendRedirect("boardSearchTitle.jsp");
		
		// 선택사항(내용)
		}else if(wantContent.equals("content")) {
			wantList = dao.searchContent(memberBoardSearch);
			session.setAttribute("titleList", wantList);
			response.sendRedirect("boardSearchContent.jsp");
		
		// 선택사항(작성자)
		}else {
			wantList = dao.searchWriter(memberBoardSearch);
			session.setAttribute("titleList", wantList);
			response.sendRedirect("boardSearchWriter.jsp");

		}
		
		
	}
	
}
