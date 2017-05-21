package kdb.foodtruck.dao;


import java.util.List;

import kdb.foodtruck.dao.DBManager;
import kdb.foodtruck.dto.Owner;

import org.apache.ibatis.session.SqlSession;

public class OwnerDAO {
	private static OwnerDAO dao = new OwnerDAO();
	
	public OwnerDAO() {
		System.out.print("OwnerDAO()----------------");
	}
	
	public static OwnerDAO getInstance() {
		return dao;
	}
	
	public boolean insertOwner(Owner owner) {
		
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertOwner", owner) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public Owner checkOwner(String email) {
		SqlSession session=null;
		Owner owner = null;
		
		try{
			session= DBManager.getSqlSession();
			owner = session.selectOne("kdb.foodtruck.mapper.checkOwner", email);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return owner;
	}
	
	public Owner selectOwnerInfo(int ownerNum) {
		SqlSession session=null;
		Owner owner = null;
		
		try{
			session= DBManager.getSqlSession();
			owner = session.selectOne("kdb.foodtruck.mapper.selectOwnerInfo", ownerNum);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return owner;
	}
	
	public boolean updateOwner(Owner owner) {
		SqlSession session=null;
		boolean result= false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.update("kdb.foodtruck.mapper.updateOwner", owner)>0? true : false;
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return result;
	}
}
