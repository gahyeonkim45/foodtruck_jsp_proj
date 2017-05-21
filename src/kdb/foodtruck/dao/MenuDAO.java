package kdb.foodtruck.dao;

import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Menu;

public class MenuDAO {
	private static MenuDAO dao = new MenuDAO();
	
	public MenuDAO() {
		System.out.println("MenuDAO---------------");
	}
	
	public static MenuDAO getInstance() {
		return dao;
	}
	
	public boolean insertMenu(Menu menu) {
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertMenu", menu) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public boolean updateMenu(Menu menu) {
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.updateMenu", menu) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public Menu selectOneMenu(int num) {
		SqlSession session=null;
		Menu menu = null;
		
		try {
			session= DBManager.getSqlSession();
			menu = session.selectOne("kdb.foodtruck.mapper.selectOneMenu", num);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return menu;
	}
	
	public boolean deleteOneMenu(int num) {
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.deleteOneMenu", num) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
}
