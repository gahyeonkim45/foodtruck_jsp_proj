package kdb.foodtruck.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dto.Foodtruck;


public class MainAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		 FoodtruckDAO dao = FoodtruckDAO.getInstance();
		  List<Foodtruck> foodtrucklist = dao.showFavorite();
		  
		  //Float lat = Float.parseFloat(request.getParameter("lat"));
		  //Float lon = Float.parseFloat(request.getParameter("lon"));
		  
		  //List<Foodtruck> foodtruckdistancelist = dao.showDistance(lat,lon);
		  
		  //request.setAttribute("foodtruckdistancelist",foodtruckdistancelist);
		  request.setAttribute("foodtrucklist",foodtrucklist);

	      ActionForward forward = new ActionForward();

	      forward.setForward(true);
	      forward.setNextURL("./page/home.jsp");
	      
	      return forward;
	}
}
