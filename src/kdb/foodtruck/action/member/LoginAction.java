package kdb.foodtruck.action.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.CustomerDAO;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dao.OwnerDAO;
import kdb.foodtruck.dto.Customer;
import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Owner;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		/* customer */
		CustomerDAO cDao = CustomerDAO.getInstance();
		Customer customer = cDao.checkCustomer(email);
		
		/* owner */
		OwnerDAO oDao = OwnerDAO.getInstance();
		Owner owner =  oDao.checkOwner(email);
		
		String url = "./index.jsp";
		
		if(customer!=null) {
			/* 고객인 경우 */
			System.out.println("고객 아이디 검색 성공!");
			
			if(customer.getCustomerPwd().equals(password)) {
				/* 비밀번호 검사 검사 */
				// 고객 로그인 처리
				System.out.println("고객 로그인 성공");
				session.setAttribute("customerNum", customer.getCustomerNum());
				session.setAttribute("id", customer.getCustomerName());
				url = "foodtruck?cmd=MainAction";
			} else {
				System.out.println("고객 로그인 실패");
			}
			
		} else if(owner!=null) {
			/* 업주인 경우 */
			System.out.println("업주 아이디 검색 성공!");
			
			if(owner.getOwnerPwd().equals(password)) {
				/* 비밀번호 검사 검사 */
				// 업주 로그인 처리
				System.out.println("업주 로그인 성공");
				FoodtruckDAO fd = FoodtruckDAO.getInstance();
				
				session.setAttribute("truckId", fd.selectFoodtruckNumber(owner.getOwnerNum()));
				session.setAttribute("ownerNum", owner.getOwnerNum());
				session.setAttribute("id", owner.getOwnerName());
				System.out.printf("트럭id : %s, 업주번호 : %s, 업주이름 : %s", fd.selectFoodtruckNumber(owner.getOwnerNum()), owner.getOwnerNum(),owner.getOwnerName());
				url = "foodtruck?cmd=Owner";
			} else {
				System.out.println("업주 로그인 실패");
			}
			
		} else {
			/* 둘다 아닌 경우 */
			System.out.println("회원이 아니시네요");
		}
		
		forward.setForward(true);
		forward.setNextURL(url);
		return forward;
	}

}
