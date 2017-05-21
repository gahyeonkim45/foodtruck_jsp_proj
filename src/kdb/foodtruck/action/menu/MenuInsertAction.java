package kdb.foodtruck.action.menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.MenuDAO;
import kdb.foodtruck.dto.Menu;

public class MenuInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String path = request.getServletContext().getRealPath("/upload");
		System.out.println(path);
		MultipartRequest m = new MultipartRequest(
				request, path, 10*1024*1024, new DefaultFileRenamePolicy());
		int truckId=Integer.parseInt(session.getAttribute("truckId").toString());
		
		System.out.println("이미지 : "+m.getFilesystemName("image"));
		System.out.println("이름 : "+m.getParameter("name"));
		System.out.println("설명 : "+m.getParameter("explain"));
		System.out.println("가격 : "+m.getParameter("price"));
		
		MenuDAO dao = MenuDAO.getInstance();
		Menu menu = new Menu();
		menu.setFoodTruckNum(truckId);
		menu.setMenuExplain(m.getParameter("explain"));
		menu.setMenuName(m.getParameter("name"));
		if(m.getFilesystemName("image")!=null)
			menu.setMenuPic(m.getFilesystemName("image"));
		else
			menu.setMenuPic("");
		
		if(m.getParameter("price").isEmpty() || m.getParameter("price").equals(""))
			menu.setMenuPrice(0);
		else
			menu.setMenuPrice(Integer.parseInt(m.getParameter("price")));
		menu.setMenuType(Integer.parseInt(m.getParameter("type")));
		
		String url = "";
		boolean isF = false;
		if(dao.insertMenu(menu)) {
			isF = false;
			url = "foodtruck?cmd=MenuList";
		} else {
			request.setAttribute("msg", "insertMenu : 삽입실패");
			isF = true;
			url = "./page/errorpage.jsp";
		}
		
		forward.setForward(isF);
		forward.setNextURL(url);
		return forward;
	}

}
