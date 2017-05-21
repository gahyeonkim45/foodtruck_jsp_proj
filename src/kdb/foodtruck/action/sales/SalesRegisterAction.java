package kdb.foodtruck.action.sales;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesRegisterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());

		SalesDAO dao = SalesDAO.getInstance();
		Sales sales = new Sales();
		
		sales.setFoodtrucknum(truckId);
		sales.setSalesValue(Integer.parseInt(request.getParameter("sale")));
		
		String url = "";
		boolean isF = false;
		
		if(dao.insertSales(sales)) {
			isF = false;
			url = "foodtruck?cmd=SalesRegisterForm";
		} else {
			request.setAttribute("msg", "insertSales");
			isF = true;
			url = "./page/errorpage.jsp";
			System.out.println("에러났습니다.");
		}
		
		forward.setForward(isF);
		forward.setNextURL(url);
		return forward;
	}

}
