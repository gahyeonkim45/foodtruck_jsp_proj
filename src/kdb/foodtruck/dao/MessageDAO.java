package kdb.foodtruck.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kdb.foodtruck.dto.Menu;
import kdb.foodtruck.dto.Message;

public class MessageDAO {
	private static MessageDAO dao = new MessageDAO();
	
	public MessageDAO() {
		System.out.println("MessageDAO----------------");
	}
	
	public static MessageDAO getInstance() {
		return dao;
	}
	
	public List<Message> selectReceivedMessage(int receiver) {
		
		SqlSession session=null;
		List<Message> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectReceivedMessage", receiver);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
		
	}
	
	public List<Message> selectRecentMessage(int receiver) {
		
		SqlSession session=null;
		List<Message> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectRecentMessage", receiver);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
		
	}
	
	public Message selectReceivedOneMessage(int msgnum) {
		SqlSession session=null;
		Message msg = null;
		
		try{
			session= DBManager.getSqlSession();
			msg = session.selectOne("kdb.foodtruck.mapper.selectReceivedOneMessage", msgnum);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return msg;
		
	}
	
	public boolean insertMail(Message msg) {
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertMail", msg) > 0 ? true : false;
		} finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
		
	}
	
	public boolean deleteMail(int msgnum) {
		SqlSession session=null;
		boolean result=false;
		
		try {
			session = DBManager.getSqlSession();
			result = session.delete("kdb.foodtruck.mapper.deleteMail", msgnum)>0? true : false;
		} finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
}
