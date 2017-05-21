package kdb.foodtruck.dao;

import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Search;

public class SearchDAO {
	private static SearchDAO dao = new SearchDAO();
	ResultSet rs = null;

	private SearchDAO() {
		System.out.println("SearchDAO-------------");

	}

	public static SearchDAO getInstance() {
		return dao;
	}

	public List<Foodtruck> selectFoodTruck(String foodTruckName) {

		SqlSession session = null;
		boolean result = false;
		
		List<Foodtruck> list = null;
	
		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectFoodTruck",foodTruckName);

		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return list;
		
	}

	public boolean insertSearch(Search search) {
		SqlSession session = null;
		boolean result = false;
		
		try {
			session = DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertSearch",search)>0? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Search> selectSearch(int truckId) {
		SqlSession session = null;
		List<Search> list = null;
	
		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectSearch",truckId);

		} finally {
			DBManager.closeSqlSession(session);
		}

		return list;
	}
	
	public Search selectSearchWord(String word) {
		SqlSession session = null;
		Search search = null;
		
		try {
			session = DBManager.getSqlSession();
			search = session.selectOne("kdb.foodtruck.mapper.selectSearchWord",word);
		} finally {
			DBManager.closeSqlSession(session);
		}

		return search;
	}
	
	public boolean updateSearchWord(int num) {
		SqlSession session = null;
		boolean result = false;
		
		try {
			session = DBManager.getSqlSession();
			result = session.update("kdb.foodtruck.mapper.updateSearchWord", num) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result,session);
		}
		
		return result;
	}
	
	public List<Foodtruck> selectFoodTruckLoc (String foodTruckName) {

		SqlSession session = null;
		boolean result = false;
		
		List<Foodtruck> list = null;
	
		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectFoodTruckLoc",foodTruckName);

		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return list;
		
	}
	
	public List<Foodtruck> selectFoodTruckName(String foodTruckName) {

		SqlSession session = null;
		boolean result = false;
		
		List<Foodtruck> list = null;
	
		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectFoodTruckName",foodTruckName);

		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return list;
		
	}

}
