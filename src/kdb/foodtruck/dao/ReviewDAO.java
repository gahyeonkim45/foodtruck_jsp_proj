package kdb.foodtruck.dao;

import java.sql.ResultSet;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dto.CustomerReview;

import kdb.foodtruck.dto.Review;

public class ReviewDAO {

	private static ReviewDAO dao = new ReviewDAO();
	ResultSet rs = null;

	private ReviewDAO() {
		System.out.println("ReviewDAO-------------");

	}

	public static ReviewDAO getInstance() {
		return dao;
	}

	public boolean insertReview(Review review) {

		SqlSession session = null;
		boolean result = false;

		try {
			session = DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertReview", review) > 0 ? true : false;
			System.out.println(result);
		}finally{
			 DBManager.closeSqlSession(result, session);
		}

		return result;
	}

	public boolean deleteReview(int reviewNum) {

		SqlSession session = null;
		boolean result = false;

		try {
			session = DBManager.getSqlSession();
			result = session.delete("kdb.foodtruck.mapper.deleteReview", reviewNum) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return result;
	}

	public List<CustomerReview> selectAllReview() {

		SqlSession session = null;
		boolean result = false;

		List<CustomerReview> list = null;

		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectAllReview");

		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return list;

	}

	
	public List<CustomerReview> selectFoodReview(int foodtruckNum) {

		SqlSession session = null;
		boolean result = false;

		List<CustomerReview> list = null;

		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectFoodReview",foodtruckNum);
		
		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return list;

	}
	
	public List<CustomerReview> selectRecentReview(int foodtruckNum) {
		SqlSession session = null;
		List<CustomerReview> list = null;

		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectRecentReview",foodtruckNum);
		
		} finally {
			DBManager.closeSqlSession(session);
		}

		return list;
	}


}