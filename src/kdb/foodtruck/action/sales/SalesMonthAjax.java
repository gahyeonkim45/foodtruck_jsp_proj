package kdb.foodtruck.action.sales;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesMonthAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		
		SalesDAO dao = SalesDAO.getInstance();
		List<Sales> mlist = dao.selectSalesMonthValue(truckId);
		for(Sales s : mlist) {
			System.out.println("s.getSalesNum() : "+s.getSalesNum());
			System.out.println("s.getSalesMonth() : "+s.getSalesMonth());
			System.out.println("s.getSalesValue() : "+s.getSalesValue());
		}
		
		request.setAttribute("monthList", mlist);
		forward.setForward(true);
		forward.setNextURL("./page/chartMonthData.jsp");
		
		return forward;
	}

}
