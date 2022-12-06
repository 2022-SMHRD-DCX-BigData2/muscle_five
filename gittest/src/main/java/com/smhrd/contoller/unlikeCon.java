package com.smhrd.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.MemberDAO;

public class unlikeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int type = Integer.parseInt(request.getParameter("type").toString()); 
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.unlikeCnt(type);
		
		PrintWriter out = response.getWriter();
		
		out.print(type);
	}

}
