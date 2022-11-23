package com.smhrd.domain;

import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
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
			// 					mapper.xml의 id값
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
	public int deleteMember(String email) {
		
		int cnt = 0;
		
		try {
			// 					mapper.xml의 id값
			cnt = sqlSession.delete("deleteMember", email);
			
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

	
}
