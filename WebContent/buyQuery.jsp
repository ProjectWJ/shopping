<%@ page import="java.util.ArrayList" %>
<%@ page import="basket.Basket" %>
<%@ page import="user.User" %>
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
		String userID = request.getParameter("basUserID");
		String total = request.getParameter("total");
		
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<Basket> basList = new ArrayList<>();
		
		// 유저정보
		String sql = "SELECT userName, userAddress, userPhone FROM user WHERE userID='" + userID + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);

		if (rs.next()) {
			request.setAttribute("userName", rs.getString("userName"));
			request.setAttribute("userAddress", rs.getString("userAddress"));
			request.setAttribute("userPhone", rs.getString("userPhone"));
		}

		
		// 영수증
		sql = "SELECT basItemName, basItemPrice FROM basket WHERE basUserID='" + userID + "'";

		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while (rs.next()) {
			Basket item = new Basket();
			item.setBasItemName(rs.getString(1));
			item.setBasItemPrice(rs.getString(2));
			basList.add(item);
		}
		
		
		request.setAttribute("basList", basList);
		request.setAttribute("total", total);
		
		rs.close();
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("buyForm.jsp");
		rd.forward(request, response);
	%>
</body>
</html>