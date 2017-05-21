package kdb.foodtruck.action.menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MenuDAO;

public class MenuDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		MenuDAO dao = MenuDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		
		String url = "";
		boolean isF = false;
		
		if(dao.deleteOneMenu(num)) {
			url = "foodtruck?cmd=MenuList";
			isF = false;
		} else {
			request.setAttribute("msg", "deleteOneMenu");
			url = "./page/errorpage.jsp";
			isF = true;
		}
		forward.setForward(isF);
		forward.setNextURL(url);
		
		return forward;
	}

}
