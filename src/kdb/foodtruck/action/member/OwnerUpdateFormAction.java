package kdb.foodtruck.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dao.OwnerDAO;
import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Owner;

public class OwnerUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		int ownerNum = Integer.parseInt(session.getAttribute("ownerNum").toString());
		
		OwnerDAO oDao = OwnerDAO.getInstance();
		Owner owner = oDao.selectOwnerInfo(ownerNum);
		
		FoodtruckDAO fDao = FoodtruckDAO.getInstance();
		Foodtruck foodtruck = fDao.showFoodtruckInfo(truckId);		
		
		request.setAttribute("owner", owner);
		request.setAttribute("foodtruck", foodtruck);
		
		forward.setForward(true);
		forward.setNextURL("./page/adminUpdate.jsp");
		return forward;
	}

}
