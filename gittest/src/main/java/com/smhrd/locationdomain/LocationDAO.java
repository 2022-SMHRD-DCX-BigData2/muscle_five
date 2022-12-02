package com.smhrd.locationdomain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class LocationDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	// 도시 검색
	public List<String> selectCity(String mCity) {
		
		System.out.println("[LocationDAO : selectCity()]");

		List<String> cityList = null;
		
		
		try {
			
			cityList = sqlSession.selectList("selectCityList", mCity);
			
			if(cityList != null) {
				System.out.println("LocationDAO : 도시검색 성공");
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
		
		System.out.println(cityList);
		
		return cityList;
		
	} // 도시 검색 
	

	// 주소 검색
	public List<Location> selectAddress(Location selectLocation) {
		
		System.out.println("[LocationDAO : selectAddress()]");

		List<Location> locationList = null;
		
		
		try {
			
			locationList = sqlSession.selectList("selectAddressList", selectLocation);
			
			if(locationList != null) {
				System.out.println("LocationDAO : 주소검색 성공");
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
		
		return locationList;
		
	} // 도시 검색 
	
}
