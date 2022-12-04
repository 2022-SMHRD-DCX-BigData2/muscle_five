package com.smhrd.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.domain.MemberDAO;
import com.smhrd.domain.compositionMember;

public class prevExercise extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); 
		
		int type = Integer.parseInt(request.getParameter("type").toString());
		System.out.println("type : " + type);
		int id_num = Integer.parseInt(request.getParameter("id_num").toString());
		System.out.println("id_num : " + id_num);
		
		if(type != 1) {
			type -= 1;
		} else {
			type = 9;
		}
		
		compositionMember updateSelect = new compositionMember(type, id_num);
		
		MemberDAO dao = new MemberDAO();
		int exerciseList = dao.updateType(updateSelect); 
		
		if(exerciseList > 0) {
			System.out.println("preExercise : success");

			response.setCharacterEncoding("UTF-8");
			

		}else {
			System.out.println("preExercise : fail....");
			response.sendRedirect("routin.jsp");
		}
		
	}

}
