package kdb.foodtruck.action.member; 

import java.io.IOException; 
import java.sql.Date; 
import java.text.ParseException; 
import java.text.SimpleDateFormat; 

import javax.servlet.ServletException; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

import kdb.foodtruck.action.Action; 
import kdb.foodtruck.action.ActionForward; 
import kdb.foodtruck.dao.CustomerDAO; 
import kdb.foodtruck.dto.Customer; 


public class MemberRegisterAction implements Action { 
	
	@Override 
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException { 
		
		System.out.println("MemberRegisterAction"); 
	
		String Name = request.getParameter("name"); 
		String email = request.getParameter("email"); 
		String pwd = request.getParameter("pwd"); 
		String phoneNumber = request.getParameter("PhoneNumber"); 
		String Addr = request.getParameter("Addr");
		String BDate = request.getParameter("Bdate"); 
		String gender = request.getParameter("Gender"); 
	    
		System.out.println("Gender"); 
	    
		CustomerDAO dao =  CustomerDAO.getInstance(); 
		Customer customer = new Customer(); 
	    
		customer.setCustomerName(Name); 
		customer.setCustomerEmail(email); 
		customer.setCustomerPwd(pwd); 
		customer.setCustomerPnum(phoneNumber); 
		customer.setCustomerAddr(Addr); 
		customer.setCustomerBdate(Date.valueOf(BDate));       
		customer.setCustomerGender(gender); 
		
		    
		boolean result = dao.insertCustomer(customer); 
	
	    ActionForward forward = new ActionForward(); 
	
	    forward.setForward(true); 
	    forward.setNextURL("./index.jsp"); 
	
	    return forward; 
	} 

} 