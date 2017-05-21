package kdb.foodtruck.dto;

import java.sql.Date;

public class Event {
	
	private int eventNum;
	private	int		foodTruckNum;
	private	String	eventName;
	private	String	eventContents;
	private	Date	eventStart;
	private	Date	eventEnd;

	
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public int getFoodTruckNum() {
		return foodTruckNum;
	}
	public void setFoodTruckNum(int foodTruckNum) {
		this.foodTruckNum = foodTruckNum;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventContents() {
		return eventContents;
	}
	public void setEventContents(String eventContents) {
		this.eventContents = eventContents;
	}
	public Date getEventStart() {
		return eventStart;
	}
	public void setEventStart(Date eventStart) {
		this.eventStart = eventStart;
	}
	public Date getEventEnd() {
		return eventEnd;
	}
	public void setEventEnd(Date eventEnd) {
		this.eventEnd = eventEnd;
	}

	
}
