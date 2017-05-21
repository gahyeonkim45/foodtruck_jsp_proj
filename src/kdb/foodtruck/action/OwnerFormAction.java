package kdb.foodtruck.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dao.MessageDAO;
import kdb.foodtruck.dao.ReviewDAO;
import kdb.foodtruck.dao.SearchDAO;
import kdb.foodtruck.dto.CustomerReview;
import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Message;
import kdb.foodtruck.dto.Search;

public class OwnerFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		//업주인 경우
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		int receiver = Integer.parseInt(session.getAttribute("ownerNum").toString());
		System.out.println("session : "+receiver+"truckID : "+truckId);

		MessageDAO mDao = MessageDAO.getInstance();
		List<Message> mlist	=  mDao.selectReceivedMessage(receiver);
		List<Message> mrlist = mDao.selectRecentMessage(receiver);
		
		FoodtruckDAO fDao = FoodtruckDAO.getInstance();
		Foodtruck foodtruck = fDao.showFoodtruckInfo(truckId);
		int like = fDao.selectLike(truckId);
		
		ReviewDAO rDao = ReviewDAO.getInstance();
		List<CustomerReview> crlist = rDao.selectFoodReview(truckId);
		List<CustomerReview> crNewlist = rDao.selectRecentReview(truckId);
		
		SearchDAO sDao = SearchDAO.getInstance();
		List<Search> slist = sDao.selectSearch(truckId);
		//search.setFoodtrucknum(truckId);
		//sDao.insertSearch(truckId);
		
		request.setAttribute("mlist", mlist);
		request.setAttribute("mrlist", mrlist);
		request.setAttribute("foodtruck", foodtruck);
		request.setAttribute("like",like);
		request.setAttribute("crlist", crlist);
		request.setAttribute("crNewlist", crNewlist);
		request.setAttribute("slist", slist);
		
		forward.setForward(true);
		forward.setNextURL("./page/adminMain.jsp");
		return forward;
	}

}
