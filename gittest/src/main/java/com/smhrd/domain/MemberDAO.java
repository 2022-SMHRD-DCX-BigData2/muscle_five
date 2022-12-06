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
		
		public List<BodyComposition> bodyCompositionselectAll(int id_num){
			
			System.out.println("bodyCompositionselectAll" + id_num);
			List<BodyComposition> bodyCompositionmemberList = null;
			
			try {
				bodyCompositionmemberList = sqlSession.selectList("bodyCompositionSelectAll", id_num);
				
				if (bodyCompositionmemberList != null) {
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
			
	
			
			
			return bodyCompositionmemberList;
			
			
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
		
		public int likeCnt(int type) {
			
			int cnt = 0;
			
			
			try {
				cnt = sqlSession.update("likeCnt", type);
				
				if (cnt > 0) {
					System.out.println("DAO : 좋아요 성공!!");
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
		
		public int unlikeCnt(int type) {
			
			int cnt = 0;
			
			
			try {
				cnt = sqlSession.update("unlikeCnt", type);
				
				if (cnt > 0) {
					System.out.println("DAO : 좋아요 차감성공!!");
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
		
		public int userLikeExercise(Member likeExercise) {
			
			int cnt = 0;
			
			try {
				cnt = sqlSession.insert("userLikeExercise", likeExercise);
				
				if (cnt > 0) {
					System.out.println("DAO : 좋아요 성공!!");
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
		
		public int UnLikeExercise(Member unlikeExercise) {
			
			int cnt = 0;
			System.out.println("dao : 접근성공");
			
			try {
				cnt = sqlSession.delete("UnLikeExercise", unlikeExercise);
				
				if (cnt > 0) {
					System.out.println("DAO : 좋아요 리스트삭제!!");
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
		
		public List<Member> selectLikeExercise(int id_num) {
			
			List<Member> loginMember = null;
			
			
			try {
				loginMember = sqlSession.selectList("selectLikeExercise", id_num);
				
				if (loginMember != null) {
					System.out.println("DAO : 찾기 성공!!");
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
		
		
		public List<Member> selectExerciseCnt() {
			
			List<Member> loginMember = null;
			
			
			try {
				loginMember = sqlSession.selectList("selectExerciseCnt");
				
				if (loginMember != null) {
					System.out.println("DAO : 찾기 성공!!");
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
