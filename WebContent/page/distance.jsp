<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>    
<%@page import="kdb.foodtruck.dto.Foodtruck" %>
    
<%

List<Foodtruck> flist= (List<Foodtruck>)request.getAttribute("foodtruckdistancelist");

JSONArray a = new JSONArray();

for(int i = 0; i<flist.size(); i++) {
	
	JSONObject o = new JSONObject();
	o.put("foodtruckname",flist.get(i).getFoodTruckName());
	o.put("distance", flist.get(i).getDistance());
	o.put("foodtrucknum", flist.get(i).getFoodTruckNum());
	o.put("foodtruckpic",flist.get(i).getFoodTruckPic());
	a.add(o);
	
}

out.print(a);

%>
	
            


