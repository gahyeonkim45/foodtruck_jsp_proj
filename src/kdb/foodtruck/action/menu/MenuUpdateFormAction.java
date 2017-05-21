package kdb.foodtruck.action.menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MenuDAO;
import kdb.foodtruck.dto.Menu;

public class MenuUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		MenuDAO dao = MenuDAO.getInstance();
		int menuNum = Integer.parseInt(request.getParameter("menuId"));
		Menu m = dao.selectOneMenu(menuNum);
		
		request.setAttribute("menu", m);
		forward.setForward(true);
		forward.setNextURL("./page/menuUpdate.jsp");
		return forward;
	}

}
