package kdb.foodtruck.action.member;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.CustomerDAO;
import kdb.foodtruck.dto.Customer;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		CustomerDAO dao = CustomerDAO.getInstance();
		
		Customer customer = new Customer();
		customer.setCustomerNum(Integer.parseInt(session.getAttribute("customerNum").toString()));
		customer.setCustomerName(request.getParameter("name"));
		customer.setCustomerEmail(request.getParameter("email"));
		customer.setCustomerGender(request.getParameter("gender"));
		customer.setCustomerPwd(request.getParameter("pwd"));
		customer.setCustomerAddr(request.getParameter("addr"));
		customer.setCustomerPnum(request.getParameter("pnum"));
		Date date = Date.valueOf(request.getParameter("bdate"));
		customer.setCustomerBdate(date);
		
		if(dao.updateCustomer(customer)) {
			forward.setForward(true);
			forward.setNextURL("./page/customerUpdate.jsp");
		} else {
			System.out.println("수정실패!!");
		}
		
		forward.setForward(true);
		forward.setNextURL("./index.jsp");
		
		return forward;
	}

}
