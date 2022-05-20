<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="item.Item" %>  
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %>
	<%
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<Item> list = new ArrayList<>(); // Item 객체 형태로 arraylist에 저장
		
		String sql = "select itemNum, itemName, itemPrice, itemVolume, itemDate from item order by itemNum asc";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while (rs.next()) {
			Item item = new Item();
			item.setItemNum(rs.getString(1));
			item.setItemName(rs.getString(2));
			item.setItemPrice(rs.getString(3));
			item.setItemVolume(rs.getString(4));
			item.setItemDate(rs.getString(5));
			list.add(item);
		}
		
		request.setAttribute("list", list);
		
		rs.close(); 
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("itemManage.jsp");
		rd.forward(request, response);
	%>
</body>
</html>