package com.smhrd.boardcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;

public class commentWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int id_num = Integer.parseInt(request.getParameter("userNum").toString());
		int board_num = Integer.parseInt(request.getParameter("boardNum").toString());
		String user_comment = request.getParameter("comment");
		

		System.out.println("id_num : " + id_num);
		System.out.println("board_num : " + board_num);
		System.out.println("user_comment : " + user_comment);
		
		
		Member_Board InsertComment = new Member_Board(user_comment, id_num, board_num);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.commentInsert(InsertComment);
		
		if(cnt > 0){
        	System.out.println("댓글 작성 성공");
        	response.sendRedirect("BoardDetail.jsp");
            
        } else {
            
            System.out.println("댓글 작성 오류");
            response.sendRedirect("BoardDetail.jsp");
        }
				
	}

}
