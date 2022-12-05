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


public class selelctDay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); 
		
		int type = Integer.parseInt(request.getParameter("type").toString());
		
		MemberDAO dao = new MemberDAO();
		compositionMember exerciseList = dao.selectExercise(type);
		
		if(exerciseList != null) {
			
			Gson gson = new Gson();
			String json = gson.toJson(exerciseList);
			
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.print(json);
		
		}
	}

}
