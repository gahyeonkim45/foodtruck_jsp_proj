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
			/* ���� ��� */
			System.out.println("�� ���̵� �˻� ����!");
			
			if(customer.getCustomerPwd().equals(password)) {
				/* ��й�ȣ �˻� �˻� */
				// �� �α��� ó��
				System.out.println("�� �α��� ����");
				session.setAttribute("customerNum", customer.getCustomerNum());
				session.setAttribute("id", customer.getCustomerName());
				url = "foodtruck?cmd=MainAction";
			} else {
				System.out.println("�� �α��� ����");
			}
			
		} else if(owner!=null) {
			/* ������ ��� */
			System.out.println("���� ���̵� �˻� ����!");
			
			if(owner.getOwnerPwd().equals(password)) {
				/* ��й�ȣ �˻� �˻� */
				// ���� �α��� ó��
				System.out.println("���� �α��� ����");
				FoodtruckDAO fd = FoodtruckDAO.getInstance();
				
				session.setAttribute("truckId", fd.selectFoodtruckNumber(owner.getOwnerNum()));
				session.setAttribute("ownerNum", owner.getOwnerNum());
				session.setAttribute("id", owner.getOwnerName());
				System.out.printf("Ʈ��id : %s, ���ֹ�ȣ : %s, �����̸� : %s", fd.selectFoodtruckNumber(owner.getOwnerNum()), owner.getOwnerNum(),owner.getOwnerName());
				url = "foodtruck?cmd=Owner";
			} else {
				System.out.println("���� �α��� ����");
			}
			
		} else {
			/* �Ѵ� �ƴ� ��� */
			System.out.println("ȸ���� �ƴϽó׿�");
		}
		
		forward.setForward(true);
		forward.setNextURL(url);
		return forward;
	}

}
