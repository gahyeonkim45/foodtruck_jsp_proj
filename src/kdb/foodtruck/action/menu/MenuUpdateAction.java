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

public class MenuUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MenuDAO dao = MenuDAO.getInstance();
		Menu menu = new Menu();
		//System.out.println(request.getParameter("num"));
		
		String path = request.getServletContext().getRealPath("/upload");
		System.out.println(path);
		MultipartRequest m = new MultipartRequest(
				request, path, 10*1024*1024, new DefaultFileRenamePolicy());
		int menuNum = Integer.parseInt(m.getParameter("num"));
		
		menu.setMenuNum(menuNum);
		menu.setMenuName(m.getParameter("name"));
		menu.setMenuExplain(m.getParameter("explain"));
		menu.setMenuPrice(Integer.parseInt(m.getParameter("price")));
		menu.setMenuType(Integer.parseInt(m.getParameter("type")));
		if(m.getFilesystemName("image")!=null)
			menu.setMenuPic(m.getFilesystemName("image"));
		else
			menu.setMenuPic(m.getParameter("oldimage"));
		
		String url = "";
		boolean isF = false;
		
		if(dao.updateMenu(menu)) {
			url = "foodtruck?cmd=MenuList";
			isF = false;
		} else {
			request.setAttribute("msg", "updateMenu");
			url = "./page/errorpage.jsp";
			isF = true;
		}
		
		forward.setForward(isF);
		forward.setNextURL(url);
		
		return forward;
	}

}
