package kdb.foodtruck.action.search;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dto.Foodtruck;

public class AllEventFoodtruckListFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		FoodtruckDAO dao = FoodtruckDAO.getInstance();
		
		List<Foodtruck> list = dao.selectEventFoodtruck();
		int count = dao.selectEventFoodtruckCount();
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println("page num : "+page);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		forward.setForward(true);
		forward.setNextURL("./page/eventlist.jsp");
		
		return forward;
	}

}
