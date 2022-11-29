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
	    
	    // 1. email,pw 파라미터 수집
	    //int board_num = request.getParameter("board_num");
	    String board_id = request.getParameter("board_id");
	    String board_title = request.getParameter("board_title");
	    String board_content = request.getParameter("board_content");
	    // String board_file = request.getParameter("board_file");
	    
	    // Member 객체에 담아주기  
		Member_Board boardlist = new Member_Board(board_id, board_title, board_content);
		//System.out.println(login.toString());
		
		// DAO 메소드 실행
		BoardDAO dao = new BoardDAO();
		Member_Board BoardList = (Member_Board) dao.BoardselectAll();
		
		
		if(BoardList != null) {
			//세션 객체 생성
			HttpSession session = request.getSession();
			session.setAttribute("boardList", BoardList);
		} else {
			// 로그인 실채했으면
			// 로그인 실패 출력하고 main.jsp로 이동
	        System.out.println("게시글 목록 보기 실패...");
	    }
		// session에 값 저장했으면 main.jsp로 이동
		response.sendRedirect("main.jsp");
		
		
	}

}
