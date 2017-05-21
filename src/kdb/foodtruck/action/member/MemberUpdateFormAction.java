package kdb.foodtruck.action.member;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.CustomerDAO;
import kdb.foodtruck.dto.Customer;

public class MemberUpdateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		CustomerDAO dao = CustomerDAO.getInstance();
		Customer customer = new Customer();
		customer.setCustomerNum(Integer.parseInt(session.getAttribute("customerNum").toString()));
		List<Customer> currentUser = dao.selectOneCustomer(customer);
		
		request.setAttribute("user", currentUser);
		forward.setForward(true);
		forward.setNextURL("./page/customerUpdate.jsp");
		
		return forward;
	}

}
