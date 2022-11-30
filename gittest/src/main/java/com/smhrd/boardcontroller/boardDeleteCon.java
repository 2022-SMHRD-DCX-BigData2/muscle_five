package com.smhrd.boardcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;
import com.smhrd.domain.MemberDAO;


public class boardDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_num = Integer.parseInt(request.getParameter("num").toString());
		
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.deleteBoard(board_num);
				
		
		if(cnt > 0) {
			System.out.println("DeleteCon : 게시글 삭제 성공!");
		} else {
			System.out.println("DeleteCon : 게시글 삭제 실패..");
		}
		response.sendRedirect("BoardList.jsp");
	}

}
