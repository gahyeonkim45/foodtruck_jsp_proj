package kdb.foodtruck.action.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MessageDAO;

public class DeleteMsgAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		int msgnum = Integer.parseInt(request.getParameter("msgnum"));
		
		MessageDAO dao = MessageDAO.getInstance();
		
		String url = "";
		if(dao.deleteMail(msgnum)) {
			url = "./index.jsp";
		} else {
			request.setAttribute("msg", "deleteMail");
			url = "./page/errorpage.jsp";
		}
		
		forward.setForward(true);
		forward.setNextURL(url);
		return forward;
	}

}
