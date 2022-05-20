<%@ page import="java.util.ArrayList" %>
<%@ page import="item.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		String itemCategory = request.getParameter("itemCategory"); // 카테고리를 받아 로딩
		
		if (itemCategory == null){ // 기본값은 갤럭시Z로
			itemCategory = "Galaxy Z";
		}
		
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<Item> list = new ArrayList<>(); // Item 객체 형태로 arraylist에 저장
		
		String sql = "select itemNum, itemCategory, itemName, itemPrice, itemInformation, itemImage from item where itemCategory='" + itemCategory + "' order by itemNum asc";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while (rs.next()) {
			Item item = new Item();
			item.setItemNum(rs.getString(1));
			item.setItemCategory(rs.getString(2));
			item.setItemName(rs.getString(3));
			item.setItemPrice(rs.getString(4));
			item.setItemInformation(rs.getString(5));
			item.setItemImage(rs.getString(6));
			list.add(item);
		}
		
		request.setAttribute("itemCategory", itemCategory);
		request.setAttribute("list", list);
		
		rs.close();
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("mainStart.jsp");
		rd.forward(request, response);
	%>
</body>
</html>