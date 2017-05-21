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

public class AllFoodtruckListFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		FoodtruckDAO dao = FoodtruckDAO.getInstance();
		
		System.out.println("page num : "+ request.getParameter("page"));
		int page = Integer.parseInt(request.getParameter("page"));
		List<Foodtruck> list = dao.selectFoodtruckListByPage();
		
		int count = dao.selectCountFoodtruck();
		System.out.println("foodtruck count : "+ count);
		
		request.setAttribute("page", page);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		forward.setForward(true);
		forward.setNextURL("./page/truckList.jsp");
		return forward;
	}

}
