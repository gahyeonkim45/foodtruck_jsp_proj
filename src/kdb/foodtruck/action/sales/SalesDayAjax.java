package kdb.foodtruck.action.sales;

import java.io.IOException;
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
import java.sql.Timestamp;

public class SalesDayAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

        Timestamp current = new Timestamp((new Date()).getTime());
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		System.out.println("month:"+ request.getParameter("month"));
		String month = request.getParameter("month");
		if(Integer.parseInt(month)<10) {
			month="0"+month;
		} 
		
		SalesDAO dao = SalesDAO.getInstance();
		List<Sales> nlist = dao.selectNowDaySales(truckId);
		List<Sales> mlist = dao.selectSalesDayValue(truckId, month);
		
		request.setAttribute("dayList", mlist);
		
		forward.setForward(true);
		forward.setNextURL("./page/chartDayData.jsp");
		return forward;
	}

}
