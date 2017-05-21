package kdb.foodtruck.dto;

import java.sql.Date;

public class Search {
	private int		searchnum;
	private	int		foodtrucknum;
	private	String	searchword;
	private	Date	searchdate;
	private int		searchcount;
	
	public int getSearchcount() {
		return searchcount;
	}
	public void setSearchcount(int searchcount) {
		this.searchcount = searchcount;
	}
	public int getSearchnum() {
		return searchnum;
	}
	public void setSearchnum(int searchnum) {
		this.searchnum = searchnum;
	}
	public int getFoodtrucknum() {
		return foodtrucknum;
	}
	public void setFoodtrucknum(int foodtrucknum) {
		this.foodtrucknum = foodtrucknum;
	}
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	public Date getSearchdate() {
		return searchdate;
	}
	public void setSearchdate(Date searchdate) {
		this.searchdate = searchdate;
	}
	
	

}
