package com.smhrd.locationcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.locationdomain.Location;
import com.smhrd.locationdomain.LocationDAO;

public class LocationAddressListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.err.println("[LocationAddressListCon]");
		
		request.setCharacterEncoding("UTF-8");
		
		String json = request.getParameter("json");
		
		System.out.println(json);
		
		Gson gson = new Gson();
		
		// Gson에 있는 fromJson(json데이터, 저장할 변수의 클래스 정보)
		// 가져온 json 데이터를 캘린더 객체로 생성
		Location[] location = gson.fromJson(json, Location[].class);
		Location selectLocation = location[0];
		//System.out.println(selectLocation.getLoc_add1());
		//System.out.println(selectLocation.getLoc_add2());
		
		LocationDAO dao = new LocationDAO();
		
		
		List<Location> locationList = dao.selectAddress(selectLocation);
		
		
		// 자바코드에서 만들어낸 리스트를 json 문자열로 바꿈
		// Gson에 있는 toJson()
		json = gson.toJson(locationList);
		
		// 보내기 전에 인코딩
		response.setCharacterEncoding("UTF-8");
		
		// 보내는 통로 출력스트림 PrintWriter 객체 생성
		PrintWriter out = response.getWriter();
		
		// 결과값을 보내는 out.print();
		System.out.println("ajax로 보낼객체 확인 : " + json);
		
		// 전송
		out.print(json);
	
	
	}

}
