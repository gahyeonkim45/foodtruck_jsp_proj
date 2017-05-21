package kdb.foodtruck.action.member; 

import java.io.IOException; 

import javax.servlet.ServletException; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

import kdb.foodtruck.action.Action; 
import kdb.foodtruck.action.ActionForward; 

public class MemberRegisterFormAction implements Action { 
	
	@Override 
	public ActionForward execute(HttpServletRequest request, 
					HttpServletResponse response) throws ServletException, IOException { 
		// TODO Auto-generated method stub 
		
		System.out.println("MemberRegisterFormAction"); 
		
		ActionForward forward = new ActionForward(); 
		
		forward.setForward(true); 
		forward.setNextURL("./page/register.jsp"); 
		return forward; 
	  
	} 

} 