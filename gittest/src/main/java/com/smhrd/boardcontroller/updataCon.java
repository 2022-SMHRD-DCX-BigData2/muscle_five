package com.smhrd.boardcontroller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;


public class updataCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기출력??");
		request.setCharacterEncoding("UTF-8");
		
		String encType = "UTF-8";
        int fileSize= 5*1024*1024;
        String uploadPath = "C:/image";

        MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, encType, new DefaultFileRenamePolicy());
        
        HttpSession session = request.getSession();
        Member_Board board_num = (Member_Board) session.getAttribute("updateBoardNum");
        int boardNum = board_num.getBoard_num();
        System.out.println("udateCon board_num : " + boardNum);
        BoardDAO dao = new BoardDAO();
        
        String board_id = multi.getParameter("board_id");
        String board_title = multi.getParameter("board_title");
        String board_content = multi.getParameter("board_content");    
	        
        String board_file = multi.getFilesystemName("board_file");
        String original = multi.getOriginalFileName("board_file");
        String type = multi.getContentType("board_file");
        File f = multi.getFile("board_file");
        
        System.out.println("저장된 파일 이름 : " + board_file + "<br/>");
        System.out.println("실제 파일 이름 : " + original + "<br/>");
        System.out.println("파일 타입 : " + type + "<br/>");
        if (f != null) {
        	System.out.println("크기 : " + f.length()+"바이트");
        	System.out.println("<br/>");
        }else {
        	board_file = "";
        }
             
        
        Member_Board borderData = new Member_Board(boardNum, board_title, board_content, board_file);
            
        
        int result = dao.updateBoard(borderData);
            
        if(result>0){
        	System.out.println("글 수정 성공");
        	RequestDispatcher rd = request.getRequestDispatcher("BoardList.jsp");
			request.setAttribute("board_id", board_id);
			rd.forward(request, response);
            
        } else {
            
            System.out.println("글 수정 오류");
            response.sendRedirect("BoardWrite.jsp");
        }
		
	}

}
