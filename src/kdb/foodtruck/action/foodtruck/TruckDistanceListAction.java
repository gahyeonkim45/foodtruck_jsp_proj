package kdb.foodtruck.action.foodtruck;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dto.Foodtruck;

public class TruckDistanceListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("TruckDistanceListAction");
		  FoodtruckDAO dao = FoodtruckDAO.getInstance();
		  		  
		  //Float lat = 37.0F;  //Float.parseFloat(request.getParameter("lat"));
		  //Float lon = 127.0F; //Float.parseFloat(request.getParameter("lon"));
		  Float lat = Float.parseFloat(request.getParameter("lat"));
		  Float lon = Float.parseFloat(request.getParameter("lon"));
		  
		  
		  System.out.println(lat +"="+ lon);
		  
		  List<Foodtruck> foodtruckdistancelist = dao.showDistance(lat,lon);
		  
		  request.setAttribute("foodtruckdistancelist",foodtruckdistancelist);
		  
	      ActionForward forward = new ActionForward();

	      forward.setForward(true);
	      forward.setNextURL("./page/distance.jsp");
	      
	      return forward;
	}

}
