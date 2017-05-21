package kdb.foodtruck.action.sales;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesRegisterFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		int ownerNum = Integer.parseInt(session.getAttribute("ownerNum").toString());
		
		System.out.println("sales foodtruck id : "+truckId);

		Timestamp current = new Timestamp((new Date()).getTime());
		
		SalesDAO dao = SalesDAO.getInstance(); 
		List<Sales>	alist = dao.selectAllSales(truckId);
		List<Sales> wlist = dao.selectWeekSalesValue(truckId, current);
		
		System.out.println(alist.get(0).getSalesValue());
		System.out.println(wlist.get(0).getSalesValue());
		
		request.setAttribute("aList", alist);
		request.setAttribute("wList", wlist);
		
		forward.setForward(true);
		forward.setNextURL("./page/adminSales.jsp");
		
		return forward;
	}

}
