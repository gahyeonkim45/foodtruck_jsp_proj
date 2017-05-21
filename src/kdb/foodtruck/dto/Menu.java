package kdb.foodtruck.dto;

public class Menu {
	private int		menuNum;
	private	int		foodTruckNum;
	private	String	menuName;
	private	int		menuPrice;
	private	int		menuType;
	private	String	menuExplain;
	private	String	menuPic;
	
	public int getFoodTruckNum() {
		return foodTruckNum;
	}
	public void setFoodTruckNum(int foodTruckNum) {
		this.foodTruckNum = foodTruckNum;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public int getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}
	public int getMenuType() {
		return menuType;
	}
	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}
	public String getMenuExplain() {
		return menuExplain;
	}
	public void setMenuExplain(String menuExplain) {
		this.menuExplain = menuExplain;
	}
	public String getMenuPic() {
		return menuPic;
	}
	public void setMenuPic(String menuPic) {
		this.menuPic = menuPic;
	}
	
	
}
