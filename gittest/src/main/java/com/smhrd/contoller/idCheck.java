package com.smhrd.contoller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.MemberDAO;


public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
		//
	        String id = request.getParameter("id");

	        MemberDAO dao =  new MemberDAO();
	        int result = dao.confirmid(id);
	        
	        request.setAttribute("id", id);
	        request.setAttribute("result", result);
	        
	        if(result > 0) {
				System.out.println("idCheck Controller : 아이디 중복확인 성공!");
				RequestDispatcher rd = request.getRequestDispatcher("idcheck.jsp");
				rd.forward(request, response);
	        }
	        else {
				System.out.println("idCheck Controller : 아이디 중복확인 실패..");
				// 회원가입 실패하면 join.jsp로 이동.
				response.sendRedirect("join.jsp");
			}
	        
	}
	
}

