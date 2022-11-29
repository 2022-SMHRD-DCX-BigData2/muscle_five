package com.smhrd.boardcontroller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;


public class BoardWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String encType = "UTF-8";
		// 업로드 파일 사이즈
        int fileSize= 5*1024*1024;
        // 업로드될 폴더 경로
        String uploadPath = request.getServletContext().getRealPath("/UploadFolder");
 
        // 파일업로드 
        MultipartRequest multi = new MultipartRequest(request, uploadPath, fileSize, encType, new DefaultFileRenamePolicy());
 
        // 파일이름 가져오기
//        String fileName = "";
//        Enumeration<String> names = multi.getFileNames();
//            
//        if(names.hasMoreElements()){
//        
//        	String name = names.nextElement();
//            fileName = multi.getFilesystemName(name);
//        }
        
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
             
        
        Member_Board borderData = new Member_Board(board_id, board_title, board_content, board_file);
            
        
        int result = dao.boardInsert(borderData);
            
        if(result>0){
        	System.out.println("글 작성 성공");
        	RequestDispatcher rd = request.getRequestDispatcher("BoardList.jsp");
			request.setAttribute("board_id", board_id);
			rd.forward(request, response);
            
        } else {
            
            System.out.println("글 작성 오류");
            response.sendRedirect("BoardWrite.jsp");
        }
		
	}

}
