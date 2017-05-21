package kdb.foodtruck.action.foodtruck;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;

public class TruckFavoriteUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id=request.getParameter("id");
		
		
		FoodtruckDAO dao = FoodtruckDAO.getInstance();
		
		dao.updateFavorite(Integer.parseInt(id));
		
//		 ActionForward forward = new ActionForward();
//
//	      forward.setForward(true);
//	      forward.setNextURL("./page/MenuDetail.jsp");
	      
	      return null;//forward;
		
	
	}

}