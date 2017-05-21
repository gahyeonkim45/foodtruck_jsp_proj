package kdb.foodtruck.dao;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kdb.foodtruck.dao.DBManager;
import kdb.foodtruck.dto.Sales;

import org.apache.ibatis.session.SqlSession;

public class SalesDAO {
	private static SalesDAO dao = new SalesDAO();
	
	public SalesDAO() {
		System.out.println("SalesDAO-------------");
	}
	
	public static SalesDAO getInstance() {
		return dao;
	}
	
	public boolean insertSales(Sales sales) {
		
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertSales", sales) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Sales> selectWeekSalesValue(int truckId, Timestamp date) {
		SqlSession session=null;
		List<Sales> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("truck", truckId);
		map.put("month", date);
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectWeekSalesValue", map);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public List<Sales> selectWeekSales(int truckId) {
		SqlSession session=null;
		List<Sales> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectWeekSales", truckId);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public List<Sales> selectAllSales(int truckId) {
		SqlSession session=null;
		List<Sales> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectAllSales", truckId);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public boolean updateSales(Sales sales) {
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.updateSales", sales) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Sales> selectSalesMonthValue(int truckId) {
		SqlSession session=null;
		List<Sales> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectSalesMonthValue", truckId);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public List<Sales> selectSalesDayValue(int truckId, String date) {
		SqlSession session=null;
		List<Sales> list = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("truck", truckId);
		map.put("month", date);
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectSalesDayValue", map);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public List<Sales> selectNowDaySales(int truckId) {
		SqlSession session=null;
		List<Sales> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectNowDaySales", truckId);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
}
