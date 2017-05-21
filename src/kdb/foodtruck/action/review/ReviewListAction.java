package kdb.foodtruck.action.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.ReviewDAO;
import kdb.foodtruck.dto.CustomerReview;


public class ReviewListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ReviewDAO dao = ReviewDAO.getInstance();
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		List<CustomerReview> list = dao.selectFoodReview(id); 

		request.setAttribute("list2", list);
		request.setAttribute("id", id);
		
		ActionForward forward = new ActionForward();
		
		forward.setNextURL("foodtruck?cmd=TruckDetailForm");
		forward.setForward(true);

		return forward;
	}

}
