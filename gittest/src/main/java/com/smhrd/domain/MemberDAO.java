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
		

	
	
}
