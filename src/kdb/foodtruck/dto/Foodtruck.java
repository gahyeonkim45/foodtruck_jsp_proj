package kdb.foodtruck.dto;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Foodtruck {
	private	int		foodTruckNum;
	private	String	foodTruckName;
	private	String	foodTruckOwnum; 
	private	int		foodTruckTypenum; 
	private	String	foodTruckAddr;
	private	Timestamp	foodTruckOpen;
	private	Timestamp	foodTruckClose; 
	private	String	foodTruckIntro;
	private Double  foodTruckAddrLat;
	private Double  foodTruckAddrAlt;
	private	int		foodTruckLike;
	private String  foodTruckPic;
	private String 	m_fileFullPath;

	public String getM_fileFullPath() {
		return m_fileFullPath;
	}
	public void setM_fileFullPath(String m_fileFullPath) {
		this.m_fileFullPath = m_fileFullPath;
	}
	public String getFoodTruckPic() {
		return foodTruckPic;
	}
	public void setFoodTruckPic(String foodTruckPic) {
		this.foodTruckPic = foodTruckPic;
	}
	private float 	distance;
	
	public int getFoodTruckNum() {
		return foodTruckNum;
	}
	public void setFoodTruckNum(int foodTruckNum) {
		this.foodTruckNum = foodTruckNum;
	}
	public String getFoodTruckName() {
		return foodTruckName;
	}
	public void setFoodTruckName(String foodTruckName) {
		this.foodTruckName = foodTruckName;
	}
	public String getFoodTruckOwnum() {
		return foodTruckOwnum;
	}
	public void setFoodTruckOwnum(String foodTruckOwnum) {
		this.foodTruckOwnum = foodTruckOwnum;
	}
	public int getFoodTruckTypenum() {
		return foodTruckTypenum;
	}
	public void setFoodTruckTypenum(int foodTruckTypenum) {
		this.foodTruckTypenum = foodTruckTypenum;
	}
	public String getFoodTruckAddr() {
		return foodTruckAddr;
	}
	public void setFoodTruckAddr(String foodTruckAddr) {
		this.foodTruckAddr = foodTruckAddr;
	}
	public Timestamp getFoodTruckOpen() {
		return foodTruckOpen;
	}
	public void setFoodTruckOpen(Timestamp foodTruckOpen) {
		this.foodTruckOpen = foodTruckOpen;
	}
	public Timestamp getFoodTruckClose() {
		return foodTruckClose;
	}
	public void setFoodTruckClose(Timestamp foodTruckClose) {
		this.foodTruckClose = foodTruckClose;
	}
	public String getFoodTruckIntro() {
		return foodTruckIntro;
	}
	public void setFoodTruckIntro(String foodTruckIntro) {
		this.foodTruckIntro = foodTruckIntro;
	}
	public int getFoodTruckLike() {
		return foodTruckLike;
	}
	public void setFoodTruckLike(int foodTruckLike) {
		this.foodTruckLike = foodTruckLike;
	}
	public Double getFoodTruckAddrLat() {
		return foodTruckAddrLat;
	}
	public void setFoodTruckAddrLat(Double foodTruckAddrLat) {
		this.foodTruckAddrLat = foodTruckAddrLat;
	}
	public Double getFoodTruckAddrAlt() {
		return foodTruckAddrAlt;
	}
	public void setFoodTruckAddrAlt(Double foodTruckAddrAlt) {
		this.foodTruckAddrAlt = foodTruckAddrAlt;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public String timeToString(Timestamp time) {
		SimpleDateFormat sdfCurrent = new SimpleDateFormat ("hh:mm"); 
		String today = sdfCurrent.format(time); 
		
		return today;
	}
}
