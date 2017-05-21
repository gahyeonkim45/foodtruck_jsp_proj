package kdb.foodtruck.action.menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MenuDAO;
import kdb.foodtruck.dto.Menu;

public class MenuInfoFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		MenuDAO dao = MenuDAO.getInstance();
		Menu menu = new Menu();
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		menu = dao.selectOneMenu(menuId);
		
		request.setAttribute("menu", menu);
		forward.setForward(true);
		forward.setNextURL("./page/menuInfo.jsp");
		return forward;
	}

}
