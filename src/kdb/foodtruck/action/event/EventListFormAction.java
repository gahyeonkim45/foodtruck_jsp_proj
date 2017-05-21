package kdb.foodtruck.action.event;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.EventDAO;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dto.Event;

public class EventListFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
/*
		EventDAO dao = EventDAO.getInstance();

		List<Event> list = dao.selectAllEvent();
*/
		System.out.println("dsdasdadadadds");
		HttpSession session = request.getSession();
		
		FoodtruckDAO dao = FoodtruckDAO.getInstance();
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());  //!!!!!!!!!!!!!!!!!!!!!!!!!!!ÇªµåÆ®·°!!!!!!!!!!!!!!!!!!!!!!!!!!1
		List<Event> list = dao.showEventList(truckId);  //!!!!!!!!!!!!!!!!!!!!!!!!!!!ÇªµåÆ®·°!!!!!!!!!!!!!!!!!!!!!!!!!!1
		
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setNextURL("./page/adminEvent.jsp");
		forward.setForward(true);

		return forward;
	}

}

