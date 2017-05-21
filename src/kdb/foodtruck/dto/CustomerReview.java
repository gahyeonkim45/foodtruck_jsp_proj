package kdb.foodtruck.dto;

import java.sql.Date;

public class CustomerReview {
	
	private int ReviewNum;
	private	int		foodtruckNum; 
	private	int		customerNum;
	private	String	customerName;
	private	String	reviewContents;
	private	Date	reviewDate;
	
	
	public int getReviewNum() {
		return ReviewNum;
	}
	public void setReviewNum(int reviewNum) {
		ReviewNum = reviewNum;
	}
	public int getFoodtruckNum() {
		return foodtruckNum;
	}
	public void setFoodtruckNum(int foodtruckNum) {
		this.foodtruckNum = foodtruckNum;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getCustomerNum() {
		return customerNum;
	}
	public void setCustomerNum(int customerNum) {
		this.customerNum = customerNum;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

}
