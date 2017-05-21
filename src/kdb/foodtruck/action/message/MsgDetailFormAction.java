package kdb.foodtruck.action.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MessageDAO;
import kdb.foodtruck.dto.Message;

public class MsgDetailFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		int msgnum = Integer.parseInt(request.getParameter("msgid"));
		
		MessageDAO dao = MessageDAO.getInstance();
		Message msg = dao.selectReceivedOneMessage(msgnum);
		
		request.setAttribute("msg", msg);
		forward.setForward(true);
		forward.setNextURL("./page/msgDetail.jsp");
		return forward;
	}

}
