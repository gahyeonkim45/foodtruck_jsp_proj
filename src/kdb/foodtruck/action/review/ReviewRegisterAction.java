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
import kdb.foodtruck.dto.Review;

public class ReviewRegisterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int foodtruckNum = Integer.parseInt(request.getParameter("id"));
		int customerNum = Integer.parseInt(request.getParameter("customerid"));
		String reviewContents = request.getParameter("review");

		ReviewDAO dao = ReviewDAO.getInstance();
		
		Review review = new Review();
		
		review.setFoodtruckNum(foodtruckNum);
		review.setCustomerNum(customerNum);
		review.setReviewContents(reviewContents);
		
	    dao.insertReview(review);

		List<CustomerReview> list = dao.selectFoodReview(foodtruckNum); // foodtruckid

		request.setAttribute("list2", list);
		
		request.setAttribute("id",foodtruckNum);

		
		ActionForward forward = new ActionForward();
		forward.setForward(true);	
		forward.setNextURL("foodtruck?cmd=TruckDetailForm");
	
		
		return forward;
	}

}
