package com.smhrd.boarddomain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.boarddatabase.SqlSessionManager;
import com.smhrd.domain.Member;

public class BoardDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	 // (게시글 번호 증가시키기 위한)시퀀스를 가져온다.
    public int getSeq() {
    	
        int result = 1;
        
        try {
    			// 					mapper.xml의 id값
    			result = sqlSession.selectOne("Sequence");
    			
    			// 만약에 내가 원하는 일을 했으면 DB에 반영
    			if (result > 1) {
    				System.out.println("DAO : 시퀀스값 가져오기 성공!!");
    				sqlSession.commit();
    			} else {
    				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
    				sqlSession.rollback();
    			}
    			
    		} catch (Exception e) {
    			// TODO: handle exception
    			e.printStackTrace();
    		} finally {
    			// 빌렸던 Connection 객체를 반납
    			sqlSession.close();
    		}
        	
        return result;    
    } // 시퀀스 가져오기 끝!
    
    // 글쓰기 기능 구현
 	public int boardInsert(Member_Board board) {
 		
 		int result = 0;
 		
 		try {
 			// 					mapper.xml의 id값
 			result = sqlSession.insert("boardInsert", board);
 			
 			// 만약에 내가 원하는 일을 했으면 DB에 반영
 			if (result > 0) {
 				System.out.println("DAO : 글쓰기 성공!!");
 				sqlSession.commit();
 			} else {
 				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
 				sqlSession.rollback();
 			}
 			
 		} catch (Exception e) {
 			// TODO: handle exception
 			e.printStackTrace();
 		} finally {
 			// 빌렸던 Connection 객체를 반납
 			sqlSession.close();
 		}
 		
 		return result;
 		
 	} // 글쓰기 끝!

 	
 	// 글 가져오기
 	public List<Member_Board> selectBoard(int board) {
		
		List<Member_Board> Board = null;
		System.out.println("selectBoard 실행");
		
		try {
			// 					mapper.xml의 id값
			// cnt = sqlSession.insert("insertMember", joinMember);
			Board = sqlSession.selectList("selectBoard", board);
			
			if (Board != null) {
				System.out.println("DAO : 글 및 댓글 가져오기 성공!!");
				
			} else {
				System.out.println("DAO : 글 및 댓글 가져오기 실패!!");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 빌렸던 Connection 객체를 반납
			sqlSession.close();
		}
		return Board;
		
	} // 글 가져오기 끝!
 	
 	
 	// 글목록 전체 검색!
 	 public List<Member_Board> BoardselectAll(){
     
         List<Member_Board> BoardList = null;
         
         //String opt = (String)listOpt.get("opt"); // 검색옵션(제목, 내용, 글쓴이 등..)
         //String condition = (String)listOpt.get("condition"); // 검색내용
         //int start = (Integer)listOpt.get("start"); // 현재 페이지번호
         
         try {
        	 
        	 //StringBuffer sql = new StringBuffer();
        	 
        	 BoardList = sqlSession.selectList("BoardselectAll");
      			
        	 // 만약에 내가 원하는 일을 했으면 DB에 반영
        	 if ( BoardList != null) {
      				System.out.println("DAO : 게시글 전체 목록 보기 성공!!");

      				
      			} else {

      			}
      		
      		} catch (Exception e) {
      			// TODO: handle exception
      			e.printStackTrace();
      		} finally {
      			// 빌렸던 Connection 객체를 반납
      			sqlSession.close();
      		}
      		
      		return BoardList;

     	}//글목록 전체 검색 끝!
 	
 	 
 	 
 	 // 게시글 상세보기
     public Member_Board selectOneBoardByNum(String board_num){
     
         Member_Board DBoard = null;
         
         try {
        	 
        	//StringBuffer sql = new StringBuffer();
 			// 					mapper.xml의 id값
        	 DBoard = sqlSession.selectOne("selectOneBoardByNum", board_num);
 			
 			// 만약에 내가 원하는 일을 했으면 DB에 반영
 			if (DBoard != null) {
 				System.out.println("DAO : 게시글 상세보기 성공!!");
 				sqlSession.commit();
 			} else {
 				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
 				sqlSession.rollback();
 			}
 			
 		} catch (Exception e) {
 			// TODO: handle exception
 			e.printStackTrace();
 		} finally {
 			// 빌렸던 Connection 객체를 반납
 			sqlSession.close();
 		}
		return DBoard;
     }// 게시글 상세보기 끝!
     
     
     // 게시글 조회수 증가
     public int updateBoardCount(String board_num) {
 		
 		int cnt = 0;
 		
 		try {
 			// 					mapper.xml의 id값
 			cnt = sqlSession.update("updateBoardCount", board_num);
 			
 			// 만약에 내가 원하는 일을 했으면 DB에 반영
 			if (cnt > 0) {
 				System.out.println("DAO : 게시글 번호 증가 성공!!");
 				sqlSession.commit();
 			} else {
 				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
 				sqlSession.rollback();
 			}
 			
 		} catch (Exception e) {
 			// TODO: handle exception
 			e.printStackTrace();
 		} finally {
 			// 빌렸던 Connection 객체를 반납
 			sqlSession.close();
 		}
 		
 		return cnt;
     }// 게시글 조회수 증가 끝!
     
     
     // 게시글 수정 
     public int updateBoard(Member_Board update) {
 		
 		int cnt = 0;
 		
 		try {
 			// 					mapper.xml의 id값
 			cnt = sqlSession.update("updateBoard", update);
 			
 			// 만약에 내가 원하는 일을 했으면 DB에 반영
 			if (cnt > 0) {
 				System.out.println("DAO : 게시글 수정 성공!!");
 				sqlSession.commit();
 			} else {
 				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
 				sqlSession.rollback();
 			}
 			
 		} catch (Exception e) {
 			// TODO: handle exception
 			e.printStackTrace();
 		} finally {
 			// 빌렸던 Connection 객체를 반납
 			sqlSession.close();
 		}
 		
 		return cnt;
     }// 게시글 수정 끝!
     
     public int updateComment(Member_Board update) {
  		
  		int cnt = 0;
  		
  		try {
  			cnt = sqlSession.update("updatecomment", update);
  			
  			if (cnt > 0) {
  				System.out.println("DAO : 댓글 수정 성공!!");
  				sqlSession.commit();
  			} else {
  			}
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			sqlSession.close();
  		}
  		
  		return cnt;
      }
     
     
     
     // 게시글 - 삭제 기능구현
     public int deleteBoard(int board_num) {
 		
 		int cnt = 0;
 		
 		try {
 			// 					mapper.xml의 id값
 			cnt = sqlSession.delete("deleteBoard", board_num);
 			
 			// 만약에 내가 원하는 일을 했으면 DB에 반영
 			if (cnt > 0) {
 				System.out.println("DAO : 게시글 삭제 성공!!");
 				sqlSession.commit();
 			} else {
 				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
 				sqlSession.rollback();
 			}
 			
 		} catch (Exception e) {
 			// TODO: handle exception
 			e.printStackTrace();
 		} finally {
 			// 빌렸던 Connection 객체를 반납
 			sqlSession.close();
 		}
 		
 		return cnt;
 		
 	} // 게시글 삭제 끝
     
     public int deleteComment(int com_num) {
  		
  		int cnt = 0;
  		
  		try {
  			// 					mapper.xml의 id값
  			cnt = sqlSession.delete("deleteComment", com_num);
  			
  			// 만약에 내가 원하는 일을 했으면 DB에 반영
  			if (cnt > 0) {
  				System.out.println("DAO : 댓글 삭제 성공!!");
  				sqlSession.commit();
  			} else {
  				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
  				sqlSession.rollback();
  			}
  			
  		} catch (Exception e) {
  			// TODO: handle exception
  			e.printStackTrace();
  		} finally {
  			// 빌렸던 Connection 객체를 반납
  			sqlSession.close();
  		}
  		
  		return cnt;
  		
  	} // 게시글 삭제 끝
   
     
     public int commentInsert(Member_Board comment) {
  		
  		int result = 0;
  		
  		try {
  			result = sqlSession.insert("commentInsert", comment);
  			
  			if (result > 0) {
  				System.out.println("DAO : 댓글쓰기 성공!!");
  				sqlSession.commit();
  			} else {
  				sqlSession.rollback();
  			}
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			sqlSession.close();
  		}
  		
  		return result;
  		
  	}
     
     public List<Member_Board> searchTitle(Member_Board searchContent) {
   		
   		List<Member_Board> result = null;
   		
   		try {
   			result = sqlSession.selectList("searchTitle", searchContent);
   			
   			if (result != null) {
   				System.out.println("DAO : 제목찾기 성공!!");
   			} else {
   			}
   			
   		} catch (Exception e) {
   			e.printStackTrace();
   		} finally {
   			sqlSession.close();
   		}
   		
   		return result;
   		
   	}
     
     public List<Member_Board> searchContent(Member_Board searchContent) {
    		
    		List<Member_Board> result = null;
    		
    		try {
    			result = sqlSession.selectList("searchContent", searchContent);
    			
    			if (result != null) {
    				System.out.println("DAO : 제목찾기 성공!!");
    			} else {
    			}
    			
    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			sqlSession.close();
    		}
    		
    		return result;
    		
    	}
     
     public List<Member_Board> searchWriter(Member_Board searchContent) {
    		
    		List<Member_Board> result = null;
    		
    		try {
    			result = sqlSession.selectList("searchWriter", searchContent);
    			
    			if (result != null) {
    				System.out.println("DAO : 제목찾기 성공!!");
    			} else {
    			}
    			
    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			sqlSession.close();
    		}
    		
    		return result;
    		
    	}
     
}
