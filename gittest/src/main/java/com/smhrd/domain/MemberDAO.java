package com.smhrd.domain;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	public int insertMember(Member joinMember) {
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("insertMember", joinMember);
			
			if (cnt > 0) {
				System.out.println("DAO : 회원가입 성공!!");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
		
	}
	
	public Member selectMember(Member login) {
		
		Member loginMember = null;
		
		
		try {
			loginMember = sqlSession.selectOne("selectMember", login);
			
			if (loginMember != null) {
				System.out.println("DAO : 로그인 성공!!");
				sqlSession.commit();
				
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return loginMember;
	}
	
	public int updateMember(Member update) {
		
		int cnt = 0;
		
		try {
			System.out.println(update.getId());
			cnt = sqlSession.update("updateMember", update);
			
			if (cnt > 0) {
				System.out.println("DAO : 회원정보수정 성공!!");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
		
		}
	
		public int updateGrade(Member updategrade) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.update("updateGrade", updategrade);
				
				if (cnt > 0) {
					System.out.println("DAO : 회원정보수정 성공!!");
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
		
			
		public List<Member> selectAll(){
			
			List<Member> memberList = null;
			
			try {
				memberList = sqlSession.selectList("selectAll");
				
				if ( memberList != null) {
					System.out.println("DAO : 회원전체검색 성공!!");
					sqlSession.commit();
					
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return memberList;
			
			
		}
	
		public int deleteUser(String id) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.delete("deleteUser", id);
				
				if (cnt > 0) {
					System.out.println("DAO : 회원삭제 성공!!");
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
		
		public int deleteUserMember(Member deletemember) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.delete("deleteUserMember", deletemember);
				
				if (cnt > 0) {
					System.out.println("DAO : 회원삭제 성공!!");
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return cnt;
		}

	
		public int insertCom(compositionMember joinMember) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.insert("insertCom", joinMember);
				
				if (cnt > 0) {
					System.out.println("DAO : composition success!!");
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return cnt;
			
		}
		
		
		public int confirmId(String id) {
				
			int cnt = 0;
				
			try {
				cnt = sqlSession.selectOne("confirmId", id);
					
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
		
		
		public compositionMember selectOneComposition(int id_num) {
			
			compositionMember loginMember = null;
			System.out.println("selectOneComposition 접속 성공!!");
			
			
			try {
				loginMember = sqlSession.selectOne("selectOneComposition", id_num);
				
				if (loginMember != null) {
					System.out.println("DAO : 성분 가져오기 성공!!");
					
				} else {
					System.out.println("DAO : 성분 가져오기 실패");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return loginMember;
		}
		
		public int updateType(compositionMember typeIdNum) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.update("updateType", typeIdNum);
				
				if (cnt > 0) {
					System.out.println("DAO : 업데이트 성공!!");
					sqlSession.commit();
					
				} else {
					System.out.println("실패...");
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return cnt;
		}
		
		public compositionMember selectExercise(int type) {
			
			compositionMember loginMember = null;
			
			
			try {
				loginMember = sqlSession.selectOne("selectExercise", type);
				
				if (loginMember != null) {
					System.out.println("DAO : 운동가져오기 성공!!");
					sqlSession.commit();
					
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return loginMember;
		}
		
		public compositionMember selectfridayExercise(int type) {
			
			compositionMember loginMember = null;
			
			
			try {
				loginMember = sqlSession.selectOne("selectfridayExercise", type);
				
				if (loginMember != null) {
					System.out.println("DAO : 운동가져오기 성공!!");
					sqlSession.commit();
					
				} else {
					sqlSession.rollback();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			
			return loginMember;
		}
		
		
		
	
	
}
