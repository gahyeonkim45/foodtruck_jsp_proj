package kdb.foodtruck.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dao.DBManager;
import kdb.foodtruck.dto.Event;
import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Menu;
import kdb.foodtruck.dto.Owner;



public class FoodtruckDAO {


	private static FoodtruckDAO dao = new FoodtruckDAO();
	public static FoodtruckDAO getInstance() {return dao;}



	public List<Foodtruck> showFavorite() {

// TODO Auto-generated method stub
		SqlSession session=null;
		List<Foodtruck> list = null;

			try{
				session= DBManager.getSqlSession();
				list = session.selectList("kdb.foodtruck.mapper.showFavorite");
			} finally{
				DBManager.closeSqlSession(session);
			}
			return list;

	}
	
	public List<Menu> showMenu(int id) {

		// TODO Auto-generated method stub
				SqlSession session=null;
				List<Menu> list = null;

					try{
						session= DBManager.getSqlSession();
						list = session.selectList("kdb.foodtruck.mapper.showMenu",id);
					} finally{
						DBManager.closeSqlSession(session);
					}
					return list;

    }
	
	public Foodtruck showFoodtruckInfo(int id) {

		// TODO Auto-generated method stub
				SqlSession session=null;
				Foodtruck foodtruck = null;

					try{
						session= DBManager.getSqlSession();
						foodtruck = session.selectOne("kdb.foodtruck.mapper.showFoodtruckInfo",id);
					} finally{
						DBManager.closeSqlSession(session);
					}
					return foodtruck;

    }
	
	public Foodtruck showFoodtruckInfoDetail(int id) {

		// TODO Auto-generated method stub
				SqlSession session=null;
				Foodtruck foodtruck = null;

					try{
						session= DBManager.getSqlSession();
						foodtruck = session.selectOne("kdb.foodtruck.mapper.showFoodtruckInfoDetail",id);
					} finally{
						DBManager.closeSqlSession(session);
					}
					return foodtruck;

    }
	
	public Owner showOwner(int id) {

		// TODO Auto-generated method stub
				SqlSession session=null;
				Owner owner = null;

					try{
						session= DBManager.getSqlSession();
						owner = session.selectOne("kdb.foodtruck.mapper.showOwner",id);
					} finally{
						DBManager.closeSqlSession(session);
					}
					return owner;

    }
	
	public Event showEvent (int id) {

		// TODO Auto-generated method stub
				SqlSession session=null;
				Event event = null;

					try{
						session= DBManager.getSqlSession();
						event = session.selectOne("kdb.foodtruck.mapper.showEvent",id);
					} finally{
						DBManager.closeSqlSession(session);
					}
					return event;

    }
	
	public List<Event> showEventList(int id) {
		SqlSession session=null;
		List<Event> list = null;

			try{
				session= DBManager.getSqlSession();
				list = session.selectList("kdb.foodtruck.mapper.showEvent", id);
			} finally{
				DBManager.closeSqlSession(session);
			}
			return list;
	}
	
	public int selectFoodtruckNumber(int ownerid) {
		SqlSession session=null;
		int foodtruck = -1;

		try{
			session= DBManager.getSqlSession();
			foodtruck = session.selectOne("kdb.foodtruck.mapper.selectFoodtruckNumber",ownerid);
		} finally{
			DBManager.closeSqlSession(session);
		}
		return foodtruck;
	}
	
	public List<Foodtruck> showDistance(float lat, float lon) {

		// TODO Auto-generated method stub
				SqlSession session=null;
				List<Foodtruck> list = null;
				
				Map<String, Float> map = new HashMap<String, Float>();
				
				System.out.println(lat);
				System.out.println(lon);
				
				map.put("lat", lat);
				map.put("lon", lon);

					try{
						session= DBManager.getSqlSession();
						list = session.selectList("kdb.foodtruck.mapper.showDistance",map);
					} finally{
						DBManager.closeSqlSession(session);
					}
					return list;

			}
	
	public List<Foodtruck> showDistance24(float lat, float lon) {

		// TODO Auto-generated method stub
		SqlSession session=null;
		List<Foodtruck> list = null;
		
		Map<String, Float> map = new HashMap<String, Float>();
		
		System.out.println(lat);
		System.out.println(lon);
		
		map.put("lat", lat);
		map.put("lon", lon);

		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.showDistance24",map);
		} finally{
			DBManager.closeSqlSession(session);
		}
		return list;

	}
	 public List<Foodtruck> selectFoodtruckListByPage() {
		SqlSession session=null;
		List<Foodtruck> list = null;
			
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectFoodtruckListByPage");
		} finally{
			DBManager.closeSqlSession(session);
		}
		return list;
	 }
	 
	 public int selectCountFoodtruck() {
		SqlSession session=null;
		int foodtruck = 0;

		try{
			session= DBManager.getSqlSession();
			foodtruck = session.selectOne("kdb.foodtruck.mapper.selectCountFoodtruck");
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		
		return foodtruck;
		
	 }
	 
	 public List<Foodtruck> selectEventFoodtruck() {
		 SqlSession session=null;
			List<Foodtruck> list = null;
				
			try{
				session= DBManager.getSqlSession();
				list = session.selectList("kdb.foodtruck.mapper.selectEventFoodtruck");
			} finally{
				DBManager.closeSqlSession(session);
			}
			return list;
	 }
	 
	 public int selectEventFoodtruckCount() {
		 SqlSession session=null;
		int count = 0;
			
		try{
			session= DBManager.getSqlSession();
			count = session.selectOne("kdb.foodtruck.mapper.selectEventFoodtruckCount");
		} finally{
			DBManager.closeSqlSession(session);
		}
		return count;
	 }
	 
	 public int selectLike(int truckId) {
		SqlSession session=null;
		int like = 0;
		
		try{
			session= DBManager.getSqlSession();
			like = session.selectOne("kdb.foodtruck.mapper.selectLike", truckId);
		} finally{
			DBManager.closeSqlSession(session);
		}
		return like;
	 }
	 
	 public boolean insertFoodtruck(Foodtruck foodtruck, Owner owner) {
			
			SqlSession session=null;
			boolean result=false;
			
			try{
				session= DBManager.getSqlSession();
				result = session.insert("kdb.foodtruck.mapper.insertFoodtruck", foodtruck) > 0 ? true : false;
				//result = session.insert("kdb.foodtruck.mapper.insertOwner", owner) > 0 ? true : false;
			}finally{
				DBManager.closeSqlSession(result, session);
			}
			
			return result;
		}
	 
	 public boolean insertFoodtruck(Foodtruck foodtruck) {
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertFoodtruck", foodtruck) > 0 ? true : false;
		} finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	 }
	 
	 public boolean updateFoodtruck(Foodtruck foodtruck) {
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.update("kdb.foodtruck.mapper.updateFoodtruck", foodtruck) > 0 ? true : false;
		} finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	 }
	 
	 public boolean updateFavorite(int id) {
			SqlSession session=null;
			boolean result=false;
			
			try {
				session= DBManager.getSqlSession();
				result = session.update("kdb.foodtruck.mapper.updateFavorite",id) > 0 ? true : false;
			} finally {
				DBManager.closeSqlSession(result, session);
			}
			
			return result;
		}
}


