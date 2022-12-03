package com.smhrd.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.Member;
import com.smhrd.domain.MemberDAO;


public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			System.out.println("중복체크");
			request.setCharacterEncoding("UTF-8");
	        String userId = request.getParameter("inputId");


	        MemberDAO dao =  new MemberDAO();
	        int result = dao.confirmId(userId);
	        
	        request.setAttribute("result", result);
	        request.setAttribute("checkedId", userId);
	        System.out.println(userId);
	        
			RequestDispatcher rd = request.getRequestDispatcher("idcheck.jsp");
			rd.forward(request, response);

	       
	}
	
}

