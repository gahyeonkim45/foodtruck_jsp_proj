package kdb.foodtruck.action.foodtruck;



import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dao.ReviewDAO;
import kdb.foodtruck.dao.SearchDAO;
import kdb.foodtruck.dto.CustomerReview;
import kdb.foodtruck.dto.Event;
import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Menu;
import kdb.foodtruck.dto.Owner;
import kdb.foodtruck.dto.Search;

public class TruckDetailFormAction  implements Action {

@Override

	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {


	String id=request.getParameter("id");
	System.out.println(id);

	FoodtruckDAO dao = FoodtruckDAO.getInstance();

	List<Menu> menulist = dao.showMenu(Integer.parseInt(id));				
	Foodtruck foodtruck = dao.showFoodtruckInfo(Integer.parseInt(id));
	Owner owner = dao.showOwner(Integer.parseInt(id));
	List<Event> eventlist = dao.showEventList(Integer.parseInt(id));
	
	// 추가부분
	/*System.out.println("word : "+request.getParameter("word"));
	String word = request.getParameter("word");
	System.out.println("word to String : "+word);
	if(word!=null){
		SearchDAO sDao = SearchDAO.getInstance();
		Search	search = sDao.selectSearchWord(word);
		
		if(search!=null) {
			sDao.updateSearchWord(search.getSearchnum());
		} else {
			search.setSearchword(word);
			search.setFoodtrucknum(foodtruck.getFoodTruckNum());
			sDao.insertSearch(search);
		}
	}*/
	// /.추가부분
	
	ReviewDAO dao2 = ReviewDAO.getInstance();
	
	
	int id2 = Integer.parseInt(request.getParameter("id"));
	List<CustomerReview> list = dao2.selectFoodReview(id2); 

	request.setAttribute("list2", list);
	
	
      request.setAttribute("menulist", menulist);
      request.setAttribute("foodtruck",foodtruck);
      request.setAttribute("owner",owner);
      request.setAttribute("eventlist",eventlist);
      
      ActionForward forward = new ActionForward();

      forward.setForward(true);
      forward.setNextURL("./page/MenuDetail.jsp");
      
      return forward;
	}

}


