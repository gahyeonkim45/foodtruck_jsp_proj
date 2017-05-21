package kdb.foodtruck.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.mapping.ResultMap;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dto.Event;

public class EventDAO {
	private static EventDAO dao = new EventDAO();
	ResultSet rs = null;

	private EventDAO() {
		System.out.println("BoardDAO-------------");

	}

	public static EventDAO getInstance() {
		return dao;
	}

	public boolean insertEvent(Event event) {

		SqlSession session = null;
		boolean result = false;

		try {
			session = DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertEvent", event) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return result;
	}

	public boolean deleteEvent(int eventnum ) {

		SqlSession session = null;
		boolean result = false;

		try {
			session = DBManager.getSqlSession();	
			result = session.delete("kdb.foodtruck.mapper.deleteEvent", eventnum) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return result;
	}
	
	
	public List<Event> selectAllEvent() {

		SqlSession session = null;
		boolean result = false;
		
		List<Event> list = null;
	
		try {
			session = DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectAllEvent");

		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return list;
		
	}

	public boolean UpdateEvent(Event event) {

		SqlSession session = null;
		boolean result = false;
		
		try {
			session = DBManager.getSqlSession();
			result = session.update("kdb.foodtruck.mapper.UpdateEvent", event) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}

		return result;

	}


}