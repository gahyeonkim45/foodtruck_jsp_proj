<%@page import="kdb.foodtruck.dto.Sales"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

JSONObject data = new JSONObject();

JSONArray colsItem = new JSONArray();
JSONArray rowsItem = new JSONArray();

JSONObject colsItemObj1 = new JSONObject();
colsItemObj1.put("id", "");
colsItemObj1.put("label", "월별");
colsItemObj1.put("pattern", "");
colsItemObj1.put("type", "string");
colsItem.add(colsItemObj1);

JSONObject colsItemObj2 = new JSONObject();
colsItemObj2.put("id", "");
colsItemObj2.put("label", "매출");
colsItemObj2.put("pattern", "");
colsItemObj2.put("type", "number");
colsItem.add(colsItemObj2);


List<Sales> list = (List<Sales>) request.getAttribute("monthList");

JSONObject rowsItemObj = null;
JSONArray cArray = null;
JSONObject cItem = null;
for(int i=0; i<list.size(); i++) {

	rowsItemObj = new JSONObject();
	
	cArray = new JSONArray();
	cItem = new JSONObject();
	
	//해당 키
	cItem.put("v", list.get(i).getSalesMonth()+"월");
	
	cItem.put("f", null);
	cArray.add(cItem);
	cItem = null;
	
	cItem = new JSONObject();
	
	//해당 값
	cItem.put("v", list.get(i).getSalesValue());
	
	cItem.put("f", null);
	cArray.add(cItem);
	cItem = null;
	
	rowsItemObj.put("c", cArray);
	cArray = null;
	
	rowsItem.add(rowsItemObj);
	rowsItemObj = null;
}

data.put("cols", colsItem);
data.put("rows", rowsItem);

out.print(data);
%>