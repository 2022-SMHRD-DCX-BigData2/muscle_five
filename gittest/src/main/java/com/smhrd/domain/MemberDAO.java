package com.smhrd.domain;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	 public Date stringToDate(Member member){
	    
	        String year = member.getBirth_yy();
	        String month = member.getBirth_mm();
	        String day = member.getBirth_dd();
	        
	        Date birth  = null;
	        
	        if(year != null && month != null && day != null)
	            birth = Date.valueOf(year + "-" + month + "-" + day);
	        
	        return birth;
	 }
	 
	// 회원가입 기능 구현
	public int insertMember(Member joinMember) {
		
		int cnt = 0;
		
		try {
			// 					mapper.xml의 id값
			cnt = sqlSession.insert("insertMember", joinMember);
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if (cnt > 0) {
				System.out.println("DAO : 회원가입 성공!!");
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
		
	} // 회원가입 끝!
	
	// 로그인 기능 구현
	public Member selectMember(Member login) {
		
		Member loginMember = null;
		//System.out.println("dao에서 id잘 가져오는지"+login.getId());
		
		try {
			// 					mapper.xml의 id값
			// cnt = sqlSession.insert("insertMember", joinMember);
			loginMember = sqlSession.selectOne("selectMember", login);
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if (loginMember != null) {
				System.out.println("DAO : 로그인 성공!!");
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
		
		return loginMember;
	} // 로그인 끝
	
	// 회원정보 수정 기능 구현
	public int updateMember(Member update) {
		
		int cnt = 0;
		
		try {
			System.out.println(update.getId());
			cnt = sqlSession.update("updateMember", update);
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if (cnt > 0) {
				System.out.println("DAO : 회원정보수정 성공!!");
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
		
	}// 회원정보 수정 끝
	
	
	
	// (광리자)->회원등급 변경 기능 구현
		public int updateGrade(Member updategrade) {
			
			int cnt = 0;
			
			try {
				// 					mapper.xml의 id값
				cnt = sqlSession.update("updateGrade", updategrade);
				
				// 만약에 내가 원하는 일을 했으면 DB에 반영
				if (cnt > 0) {
					System.out.println("DAO : 회원정보수정 성공!!");
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
			
		}// 회원등급 변경 끝!
		
		

		// 회원등급 변경 시 회원 검색
		public Member selectOne(String id) {
			
			Member userMember = null;
			
			try {
				// 					mapper.xml의 id값
				// cnt = sqlSession.insert("insertMember", joinMember);
				userMember = sqlSession.selectOne("selectOne", id);
				
				// 만약에 내가 원하는 일을 했으면 DB에 반영
				if (userMember != null) {
					System.out.println("DAO : 회원 검색 성공!!");
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
			
			return userMember;
		} // 
			
		
		
	// 회원 전체 검색 기능 구현
	public List<Member> selectAll(){
		
		List<Member> memberList = null;
		
		try {
			// 					mapper.xml의 id값
			// cnt = sqlSession.insert("insertMember", joinMember);
			memberList = sqlSession.selectList("selectAll");
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if ( memberList != null) {
				System.out.println("DAO : 회원전체검색 성공!!");
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
		
		return memberList;
		
		
	} // 회원전체검색 끝!!
	
	// 관리자-회원삭제 기능구현
	public int deleteMember(String id) {
		
		int cnt = 0;
		
		try {
			// 					mapper.xml의 id값
			cnt = sqlSession.delete("deleteMember", id);
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if (cnt > 0) {
				System.out.println("DAO : 회원삭제 성공!!");
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
		
	} // 회원삭제 끝
	
	public int deleteUserMember(Member deletemember) {
		
		int cnt = 0;
		
		try {
			// 					mapper.xml의 id값
			cnt = sqlSession.delete("deleteMember", deletemember);
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if (cnt > 0) {
				System.out.println("DAO : 회원삭제 성공!!");
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
	}

	
	public int insertCom(compositionMember joinMember) {
		
		int cnt = 0;
		
		try {
			// 					mapper.xml의 id값
			cnt = sqlSession.insert("insertCom", joinMember);
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
			if (cnt > 0) {
				System.out.println("DAO : composition success!!");
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
		
	}
	
	public int confirmid(String id) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.selectOne("confirmid", id);
				
				if (cnt > 0) {
					cnt = 1;			
				} else {
					cnt = 0;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return	cnt;
		}
	
//	public int loginCheck(String id, String pw) {

//		String dbpw = ""; // db에서 꺼낸 비밀번호를 담을 변수
//	    int x = -1;
		
//		try {
			// 					mapper.xml의 id값
			// x = sqlSession.selectOne("logincheck", logincheck);
//			x = sqlSession.selectOne("logincheck", loginCheck(id, pw));
			
			// 만약에 내가 원하는 일을 했으면 DB에 반영
//			if (rs.next()) {
//				dbpw = rs.getString("pw"); // 비번을 변수에 넣음!
				 
//               if (dbpw.equals(pw)) 
//                    x = 1; // 넘겨 받은 비번과 꺼내온 비번 비교. --> 같으면 인증 성공
//                else                  
//                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, --> 인증 실패
				
//			} else {
//				x = -1; // 해당 아이디가 없을 경우
				// 만약에 원하는 일을 못하면 다시 원래대로 돌려주기
//				sqlSession.rollback();
//			}
			
//		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
//		} finally {
			// 빌렸던 Connection 객체를 반납
//			sqlSession.close();
//		}
		
//		return x;
//	}

	
}
