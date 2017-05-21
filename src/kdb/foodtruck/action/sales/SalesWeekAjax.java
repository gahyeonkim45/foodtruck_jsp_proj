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
public class SalesWeekAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
        Timestamp current = new Timestamp((new Date()).getTime());
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		
		SalesDAO dao = SalesDAO.getInstance();
		List<Sales> nlist = dao.selectNowDaySales(truckId);
		List<Sales> mlist = dao.selectWeekSalesValue(truckId, current);
		
		request.setAttribute("weekList", mlist);
		
		forward.setForward(true);
		forward.setNextURL("./page/chartWeekData.jsp");
		return forward;
	}

}
