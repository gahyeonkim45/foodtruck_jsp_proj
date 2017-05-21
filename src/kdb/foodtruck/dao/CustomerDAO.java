package kdb.foodtruck.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dao.DBManager;
import kdb.foodtruck.dto.Customer;

public class CustomerDAO {
	private static CustomerDAO dao = new CustomerDAO();
	
	public CustomerDAO() {
		System.out.print("CustomerDAO()----------------");
	}
	
	public static CustomerDAO getInstance() {
		return dao;
	}
	
	public boolean insertCustomer(Customer customer) {
		
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertCustomer", customer) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public Customer checkCustomer(String email) {
		SqlSession session=null;
		Customer cus = null;
		
		try{
			session= DBManager.getSqlSession();
			cus = session.selectOne("kdb.foodtruck.mapper.checkCustomer", email);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return cus;
	}
	
	public boolean updateCustomer(Customer customer) {
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.updateCustomer", customer) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Customer> selectOneCustomer(Customer customer) {
		SqlSession session=null;
		List<Customer> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectOneCustomer", customer);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
}
