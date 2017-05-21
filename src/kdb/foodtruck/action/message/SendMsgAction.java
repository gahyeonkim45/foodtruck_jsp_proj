package kdb.foodtruck.action.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MessageDAO;
import kdb.foodtruck.dao.OwnerDAO;
import kdb.foodtruck.dto.Message;
import kdb.foodtruck.dto.Owner;

public class SendMsgAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		int msgsender = Integer.parseInt(session.getAttribute("ownerNum").toString());
		String msgreceiveremail = request.getParameter("receiver");
		String msgtitle = request.getParameter("title");
		String msgcontent = request.getParameter("content");

		MessageDAO mDao = MessageDAO.getInstance(); 
		OwnerDAO oDao = OwnerDAO.getInstance();

		Owner	owner = new Owner();
		owner = oDao.checkOwner(msgreceiveremail);
		int msgreceiver = owner.getOwnerNum();

		Message msg = new Message();
		msg.setMsgsender(msgsender);
		msg.setMsgreceiver(msgreceiver);
		msg.setMsgtitle(msgtitle);
		msg.setMsgcontent(msgcontent);
		
		String url = "";
		boolean isF = false;
		
		if(mDao.insertMail(msg)) {
			url = "./index.jsp";
			isF = true;
		} else {
			request.setAttribute("msg", "insertMail");
			url = "./page/errorpage.jsp";
			isF = true;
		}
			
		forward.setForward(isF);
		forward.setNextURL(url);
		return forward;
	}

}
