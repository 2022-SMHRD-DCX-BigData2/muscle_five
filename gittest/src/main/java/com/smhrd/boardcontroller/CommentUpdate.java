package com.smhrd.boardcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;

public class CommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원댓글수정Con");
		request.setCharacterEncoding("UTF-8");
		String userComment = request.getParameter("comment");
		System.out.println("수정댓글 : " + userComment);
		int comNum = Integer.parseInt(request.getParameter("updateCommentNum").toString());
		System.out.println("댓글번호 : " + comNum);
		
		Member_Board commentUpdate = new Member_Board(userComment, comNum);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.updateComment(commentUpdate);
		
		if(cnt > 0) {
			System.out.println("댓글 수정 완료");
			response.sendRedirect("BoardDetail.jsp");
		}else {
			System.out.println("댓글 수정 실패");
			response.sendRedirect("BoardDetail.jsp");
		}
		
		
		
		
	}

}
