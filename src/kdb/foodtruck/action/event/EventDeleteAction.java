package kdb.foodtruck.action.event;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.EventDAO;
import kdb.foodtruck.dto.Event;

public class EventDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		ActionForward forward = new ActionForward();

		System.out.println(request.getParameter("eventnum3"));
		int eventnum = Integer.parseInt(request.getParameter("eventnum3"));

		EventDAO dao = EventDAO.getInstance();
		
		String url = "";
		boolean isF = false;
		
		if(dao.deleteEvent(eventnum)) {
			url = "foodtruck?cmd=Eventlist";
			isF = false;
		} else {
			request.setAttribute("msg", "deleteEvent");
			url = "./page/errorpage.jsp";
			isF = true;
		}
		
		forward.setForward(isF);	
		forward.setNextURL(url);
		
		return forward;
		
	}

	
}
