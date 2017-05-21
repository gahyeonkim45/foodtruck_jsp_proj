package kdb.foodtruck.dto;

import java.sql.Timestamp;

public class Sales {
	private	int			salesNum;
	private	int			foodtruckNum;
	private	Timestamp	salesDate;
	private int			salesValue;
	private int			salesMonth;
	private String		salesWeek;
	private int			salesYear;
	private int			salesDay;
	
	public int getSalesDay() {
		return salesDay;
	}

	public void setSalesDay(int salesDay) {
		this.salesDay = salesDay;
	}

	public int getFoodtruckNum() {
		return foodtruckNum;
	}

	public void setFoodtruckNum(int foodtruckNum) {
		this.foodtruckNum = foodtruckNum;
	}

	public int getSalesMonth() {
		return salesMonth;
	}

	public void setSalesMonth(int salesMonth) {
		this.salesMonth = salesMonth;
	}

	public String getSalesWeek() {
		return salesWeek;
	}

	public void setSalesWeek(String salesWeek) {
		this.salesWeek = salesWeek;
	}

	public int getSalesYear() {
		return salesYear;
	}

	public void setSalesYear(int salesYear) {
		this.salesYear = salesYear;
	}

	public int getSalesNum() {
		return salesNum;
	}
	
	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	
	public int getFoodtrucknum() {
		return foodtruckNum;
	}
	
	public void setFoodtrucknum(int foodtruckNum) {
		this.foodtruckNum = foodtruckNum;
	}
	
	public Timestamp getSalesDate() {
		return salesDate;
	}
	
	public void setSalesDate(Timestamp salesDate) {
		this.salesDate = salesDate;
	}
	
	public int getSalesValue() {
		return salesValue;
	}
	
	public void setSalesValue(int salesValue) {
		this.salesValue = salesValue;
	}
	
	public String dateToString() {
		String day = "";
		
		switch(Integer.parseInt(salesWeek)) {
			case 1: day="일요일"; break;
			case 2: day="월요일"; break;
			case 3: day="화요일"; break;
			case 4: day="수요일"; break;
			case 5: day="목요일"; break;
			case 6: day="금요일"; break;
			case 7: day="토요일"; break;
		}
		
		return day;
	}
	
	public String getMonthDate() {
		String md = "";
		
		int month = salesDate.getMonth()+1;
		int date = salesDate.getDate();
		
		if(month<10)
			md = "0"+ Integer.toString(month) + "/";
		else
			md = Integer.toString(month) + "/";
		
		if(date<10)
			md += "0" + Integer.toString(date);
		else
			md += Integer.toString(date);
		
		
		return md;
	}
	
}
