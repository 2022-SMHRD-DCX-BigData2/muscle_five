package com.smhrd.boardcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.boarddomain.Member_Board;


public class CommentUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				request.setCharacterEncoding("UTF-8");
				String comment = request.getParameter("comment");
				int comNum = Integer.parseInt(request.getParameter("comNum").toString());
				System.out.println("comment : " + comment);
				System.out.println("comNum : " + comNum);

				Member_Board userAndComment = new Member_Board(comment, comNum);
				
				Gson gson = new Gson();
				
				String json = gson.toJson(userAndComment);
				
				response.setCharacterEncoding("UTF-8");
				
				PrintWriter out = response.getWriter();

				
				out.print(json);
				
	
	}

}
