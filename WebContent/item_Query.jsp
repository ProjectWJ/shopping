<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%@ include file="itemDB.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		String itemNum = request.getParameter("itemNum");
		
		Statement stat = null;
		ResultSet rs = null;
		
		String sql = "select * from item where itemNum=" + itemNum;
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		int result = 0;
		
		if (rs.next()) {
			result = 1;
			request.setAttribute("itemNum", rs.getString("itemNum"));
			request.setAttribute("itemCategory", rs.getString("itemCategory"));
			request.setAttribute("itemName", rs.getString("itemName"));
			request.setAttribute("itemPrice", rs.getInt("itemPrice"));
			request.setAttribute("itemVolume", rs.getString("itemVolume"));
			request.setAttribute("itemInformation", rs.getString("itemInformation"));
			request.setAttribute("itemDate", rs.getString("itemDate"));
			request.setAttribute("itemImage", rs.getString("itemImage"));
			request.setAttribute("itemImageDetail", rs.getString("itemImageDetail"));
		}
		
		request.setAttribute("result", result);
		
		rs.close();
		stat.close();
		conn.close();
	%>
	<jsp:forward page="item_detail.jsp"></jsp:forward>
</body>
</html>