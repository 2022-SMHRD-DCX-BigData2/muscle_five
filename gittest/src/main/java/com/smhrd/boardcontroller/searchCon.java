package com.smhrd.boardcontroller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.boarddomain.BoardDAO;
import com.smhrd.boarddomain.Member_Board;
import com.smhrd.domain.Member;

public class searchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				  request.setCharacterEncoding("UTF-8");
		
				  Connection conn= null;
			      PreparedStatement psmt = null;
	}
		
				  public ArrayList<Member_Board> searchTitle(String opt , String condition){//특정한 리스트를 받아서 반환
			      ArrayList<Member_Board> list = new ArrayList<Member_Board>();
			      String SQL ="select * from bbs WHERE "+opt.trim();
			      
			      ResultSet rs = null;
			      Connection conn= null;
			      
			      
			      try {
			            if(condition != null && !condition.equals("") ){//이거 빼면 안 나온다ㅜ 왜지?
			                SQL +=" LIKE '%"+condition.trim()+"%' order by ID desc limit 10";
			            }
			            
			            PreparedStatement pstmt=conn.prepareStatement(SQL);
						rs =pstmt.executeQuery();//select
						while(rs.next()) {
			            Member_Board bbs = new Member_Board();
			            bbs.setBoard_num(rs.getInt(1));
			            bbs.setBoard_title(rs.getString(2));
			            bbs.setBoard_id(rs.getString(3));
			            bbs.setBoard_date(rs.getTimestamp(4));
			            bbs.setBoard_num(rs.getInt(5));
			            list.add(bbs);//list에 해당 인스턴스를 담는다.
				         }         
				      } catch(Exception e) {
				         e.printStackTrace();
				      }
				      return list;//ㄱㅔ시글 리스트 반환
				   }
			
	}
