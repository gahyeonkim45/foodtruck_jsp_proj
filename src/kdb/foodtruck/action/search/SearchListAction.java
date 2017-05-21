package kdb.foodtruck.action.search;



import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;



import kdb.foodtruck.action.Action;

import kdb.foodtruck.action.ActionForward;

import kdb.foodtruck.dao.SearchDAO;

import kdb.foodtruck.dto.Foodtruck;



public class SearchListAction implements Action {



	@Override

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String condition = request.getParameter("type");
		String query = request.getParameter("keyword");
		System.out.println(request.getParameter("keyword"));
		System.out.println(request.getParameter("type"));

		// 추가부분
		request.setAttribute("word", query);

		SearchDAO dao = SearchDAO.getInstance();

		

		

		if(condition.equals("one")) {

			

			List<Foodtruck> list = dao.selectFoodTruck(query);

			request.setAttribute("list3", list);



			ActionForward forward = new ActionForward();



			forward.setNextURL("./page/searchList.jsp");

			forward.setForward(true);



			return forward;

		}



		else if(condition.equals("location")) {

			List<Foodtruck> list = dao.selectFoodTruckLoc(query);

			request.setAttribute("list3", list);



			ActionForward forward = new ActionForward();



			forward.setNextURL("./page/searchList.jsp");

			forward.setForward(true);



			return forward;

			

		}

		

		else if(condition.equals("name")) {

			List<Foodtruck> list = dao.selectFoodTruckName(query);

			request.setAttribute("list3", list);



			ActionForward forward = new ActionForward();



			forward.setNextURL("./page/searchList.jsp");

			forward.setForward(true);



			return forward;

			

		}

		

		

		return null;



	}
}