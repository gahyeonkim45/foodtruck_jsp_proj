package kdb.foodtruck.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		if(session.getAttribute("customerNum")!=null) {
			session.removeAttribute("customerNum");
			session.removeAttribute("id");
		} else if(session.getAttribute("ownerNum")!=null) {
			session.removeAttribute("ownerNum");
			session.removeAttribute("id");
			session.removeAttribute("truckId");
		}
		
		forward.setForward(true);
		forward.setNextURL("./index.jsp");
		return forward;
	}

}
