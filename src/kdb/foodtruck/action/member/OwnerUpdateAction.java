package kdb.foodtruck.action.member;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.FoodtruckDAO;
import kdb.foodtruck.dao.OwnerDAO;
import kdb.foodtruck.dto.Foodtruck;
import kdb.foodtruck.dto.Owner;

public class OwnerUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		int truckId = Integer.parseInt(session.getAttribute("truckId").toString());
		int ownerNum = Integer.parseInt(session.getAttribute("ownerNum").toString());
		
		String savePath = request.getServletContext().getRealPath("/upload");
	    int sizeLimit = 1024*1024*15;
	    System.out.println(savePath);
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		/* 오너 업데이트 */
	    OwnerDAO dao1 =  OwnerDAO.getInstance();
		Owner owner = new Owner();
	    
	    //String OwnerId = multi.getParameter("OwnerId");
	    String OwnerPwd = multi.getParameter("OwnerPwd");
	    String OwnerReg = multi.getParameter("OwnerReg");
	    String OwnerName = multi.getParameter("OwnerName");
	    String OwnerPnum = multi.getParameter("OwnerPnum");
	    String OwnerEmail = multi.getParameter("OwnerEmail");
	    String OwnerAddr = multi.getParameter("OwnerAddr");
		String OwnerRpic = "";
		if(multi.getFilesystemName("OwnerRpic")!=null)
			OwnerRpic = multi.getFilesystemName("OwnerRpic");
		else
			OwnerRpic = multi.getParameter("oldImage1");

		owner.setOwnerNum(ownerNum);
	    owner.setOwnerPwd(OwnerPwd);
	    owner.setOwnerReg(OwnerReg);
	    owner.setOwnerName(OwnerName);
	    owner.setOwnerPnum(OwnerPnum);
	    owner.setOwnerRpic(OwnerRpic);
	    owner.setOwnerEmail(OwnerEmail);
	    owner.setOwnerAddr(OwnerAddr);
	    
	    //업데이트로 바꿔야함.
		
		dao1.updateOwner(owner);
		System.out.println("사업자 업데이트 완료");
	    /* /.오너 업데이트 */
	    
		/* 푸드트럭 인서트 */
	    FoodtruckDAO dao =  FoodtruckDAO.getInstance();
		Foodtruck foodtruck = new Foodtruck();
	    
	    double Addrlat = Double.parseDouble(multi.getParameter("Addrlat"));
	    double Addralt = Double.parseDouble(multi.getParameter("Addralt"));
		
		String Name = multi.getParameter("FoodtruckName");
		int OwNum = ownerNum;
	    int TypeNum = Integer.parseInt(multi.getParameter("TypeNum"));
	    String Addr = multi.getParameter("FoodtruckAddr");
	    String Open = multi.getParameter("Open");
	    String Close = multi.getParameter("Close");
	    String Intro = multi.getParameter("Intro");
	    String FoodtruckPic = "";
		if(multi.getFilesystemName("FoodtruckPic")!=null)
			FoodtruckPic = multi.getFilesystemName("FoodtruckPic");
		else
			FoodtruckPic = multi.getParameter("oldImage2");
		 
	    foodtruck.setFoodTruckNum(truckId);
		foodtruck.setFoodTruckName(Name);
		foodtruck.setFoodTruckOwnum(Integer.toString(OwNum));
		foodtruck.setFoodTruckTypenum(TypeNum);
		foodtruck.setFoodTruckAddr(Addr);
		foodtruck.setFoodTruckOpen(Timestamp.valueOf(Open));
		foodtruck.setFoodTruckClose(Timestamp.valueOf(Close));      
		foodtruck.setFoodTruckIntro(Intro);
		foodtruck.setFoodTruckAddrLat(Addrlat);
		foodtruck.setFoodTruckAddrAlt(Addralt);
		foodtruck.setFoodTruckPic(FoodtruckPic);
		if(multi.getFilesystemName("FoodtruckPic")!=null)
			FoodtruckPic = multi.getFilesystemName("FoodtruckPic");
		else
			FoodtruckPic = multi.getParameter("oldImage1");
		
		if(session.getAttribute("truckId")!=null) {
			dao.updateFoodtruck(foodtruck);
		} else {
			dao.insertFoodtruck(foodtruck);
		}
		
		//boolean result = dao.insertFoodtruck(foodtruck, owner);
		/* /.푸드트럭 인서트 */

		forward.setForward(false);
		forward.setNextURL("foodtruck?cmd=OwnerUpdateForm");
				
		return forward;
	}

}
