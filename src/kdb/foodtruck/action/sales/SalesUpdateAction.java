package kdb.foodtruck.action.sales;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		SalesDAO dao = SalesDAO.getInstance();
		Sales sales = new Sales();
		
		HttpSession session = request.getSession();
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		
		Date date = Date.valueOf(request.getParameter("date"));
		Timestamp timestamp = Timestamp.valueOf(request.getParameter("date"));
		
		sales.setSalesDate(timestamp);
		sales.setSalesValue(Integer.parseInt(request.getParameter("sale")));
		
		
		String url = "";
		boolean isF = false;
		
		if(dao.updateSales(sales)) {
			isF = false;
			url = "foodtruck?cmd=SalesRegisterForm";
		} else {
			request.setAttribute("msg", "updateSales");
			isF = true;
			url = "./page/errorpage.jsp";
		}
		
		forward.setForward(isF);
		forward.setNextURL(url);
		return forward;
	}

}
