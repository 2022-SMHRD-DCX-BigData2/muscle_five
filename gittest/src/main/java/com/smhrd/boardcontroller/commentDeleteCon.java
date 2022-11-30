package com.smhrd.boardcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.boarddomain.BoardDAO;

public class commentDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String comment = (String)request.getParameter("comment");
		
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.deleteComment(comment);
				
		
		if(cnt > 0) {
			System.out.println("DeleteCon : 댓글 삭제 성공!");
		} else {
			System.out.println("DeleteCon : 댓글 삭제 실패..");
		}
		response.sendRedirect("BoardDetail.jsp");
	}

}
