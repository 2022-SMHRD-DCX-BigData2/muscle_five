package com.smhrd.calendardomain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CalendarDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
		
	// 달력에 일정 추가 하기
	public int insertCalendar(Calendar joinCalendar) {
		
		System.out.println("[CalendarDAO : insertCalendar]");
		
		int cnt = 0;
		
		try {
			
			//						mapper.xml의 id값
			cnt = sqlSession.insert("insertCalendar", joinCalendar);
			
			
			if (cnt > 0) {
				System.out.println("CalendarDAO : 일정 입력 성공");
				sqlSession.commit();
			} else {
				System.out.println("CalendarDAO : 일정 입력 실패");
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("sql 에러");
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
		
	} // 달력에 일정 입력 성공
	
	
	// 전체 일정 검색 기능
	public List<Calendar> selectAll(){
		
		System.out.println("[CalendarDAO : selectAll()]");
		
		List<Calendar> calendarList = null;
		
		try {
			
			calendarList = sqlSession.selectList("selectAllCalendar");
			
			if(calendarList != null) {
				System.out.println("CalendarDAO : 일정전체검색 성공");
				sqlSession.commit();
			} else {
				
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
		return calendarList;

	} // 전체일정검색 끝
	
	public String selectLastId() {
		
		System.out.println("[CalendarDAO : selectLastId()]");
		
		String calendarLastId = null;
		
		try {
			
			calendarLastId = sqlSession.selectOne("selectLastId");
			
			if(calendarLastId != null) {
				System.out.println("CalendarDAO : 마지막 이벤트 ID 검색 성공");
				sqlSession.commit();
			} else {
				
				sqlSession.rollback();
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sqlSession.close();
		}
		
		return calendarLastId;
		
	}

	public int deleteCalendar(String id) {
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.delete("deleteCalendar", id);
			
			if (cnt > 0) {
				System.out.println("CalendarDAO : 일정삭제 성공");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
		
	} // 일정삭제 끝
	
	// 캘린더 일정 수정 기능
	
	public int updateCalendar(Calendar update) {
		
		int cnt = 0;
		
		try {
			
			cnt = sqlSession.update("updateCalendar", update);
			
			if (cnt > 0) {
				System.out.println("CalendarDAO : 일정수정 성공");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return cnt;

	} // 캘린더 일정 수정 끝
	
}
