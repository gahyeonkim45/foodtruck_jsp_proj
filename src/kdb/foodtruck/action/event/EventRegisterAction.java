package kdb.foodtruck.action.event;


import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.EventDAO;
import kdb.foodtruck.dto.Event;

public class EventRegisterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stubString name = request.getParameter("name");
		
		HttpSession session = request.getSession();
		
		String eventName = request.getParameter("title");
		String eventContents = request.getParameter("contents");
		String eventStart = request.getParameter("start");		
		String eventEnd = request.getParameter("end");

		System.out.println(eventName);
		System.out.println(eventContents);
		System.out.println(eventStart);
		System.out.println(eventEnd);

		EventDAO dao = EventDAO.getInstance();
		
		Event event = new Event();
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());   //!!!!!!!!!!!!!!!!!!!!!!!!!!!ÇªµåÆ®·°!!!!!!!!!!!!!!!!!!!!!!!!!!1
		event.setFoodTruckNum(truckId);  //!!!!!!!!!!!!!!!!!!!!!!!!!!!ÇªµåÆ®·°!!!!!!!!!!!!!!!!!!!!!!!!!!1
		event.setEventName(eventName);
		event.setEventContents(eventContents);
		event.setEventStart(Date.valueOf(eventStart));
		event.setEventEnd(Date.valueOf(eventEnd));
		
		//dao.insertEvent(event);
		
		ActionForward forward = new ActionForward();
		
		String url = "";
		boolean isF = false;
		
		if(dao.insertEvent(event)) {
			url = "foodtruck?cmd=Eventlist";
			isF = false;
		} else {
			request.setAttribute("msg", "insertEvent");
			url = "./page/errorpage.jsp";
			isF = true;
		}

		forward.setForward(isF);	
		forward.setNextURL(url);
		
		return forward;
	}


}
