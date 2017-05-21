package kdb.foodtruck.action.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dao.MenuDAO;
import kdb.foodtruck.dto.Menu;

public class MenuListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		FoodtruckDAO dao = FoodtruckDAO.getInstance();
		
		int foodtruckId = Integer.parseInt(session.getAttribute("truckId").toString());
		List<Menu> menu = dao.showMenu(foodtruckId);
		
		request.setAttribute("menu", menu);
		forward.setForward(true);
		forward.setNextURL("./page/adminMenu.jsp");
		
		return forward;
	}

}
