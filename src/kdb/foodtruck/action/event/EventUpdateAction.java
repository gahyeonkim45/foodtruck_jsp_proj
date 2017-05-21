package kdb.foodtruck.action.event;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.EventDAO;
import kdb.foodtruck.dto.Event;

public class EventUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int eventnum = Integer.parseInt(request.getParameter("eventnum"));
		int truckId = Integer.parseInt(request.getParameter("truckId"));  //!!!!!!!!!!!!!!!!!!!!!!!!!!!ÇªµåÆ®·°!!!!!!!!!!!!!!!!!!!!!!!!!!1
		
		String eventName = request.getParameter("title2");
		String eventContents = request.getParameter("contents2");
		String eventStart = request.getParameter("start2");
		String eventEnd = request.getParameter("end2");
		
		System.out.println(eventName);
		System.out.println(eventContents);
		System.out.println(eventStart);
		System.out.println(eventEnd);
		

		EventDAO dao = EventDAO.getInstance();
		
		Event event = new Event();
		
		event.setEventNum(eventnum);
		event.setFoodTruckNum(truckId); //!!!!!!!!!!!!!!!!!!!!!!!!!!!ÇªµåÆ®·°!!!!!!!!!!!!!!!!!!!!!!!!!!1
		event.setEventName(eventName);
		event.setEventContents(eventContents);
		event.setEventStart(Date.valueOf(eventStart));
		event.setEventEnd(Date.valueOf(eventEnd));
		
		ActionForward forward = new ActionForward();
		
		String url = "";
		boolean isF = false;
		
		if(dao.UpdateEvent(event)) {
			url = "foodtruck?cmd=Eventlist";
			isF = false;
		} else {
			request.setAttribute("msg", "UpdateEvent");
			url = "./page/errorpage.jsp";
			isF = true;
		}
		
		forward.setForward(isF);	
		forward.setNextURL(url);
		
		return forward;
	}

}
