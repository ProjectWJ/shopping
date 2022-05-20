<%@ page import="java.util.ArrayList" %>
<%@ page import="basket.Basket" %>
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
		String userID = request.getParameter("userID");
		
		if(userID.equals(null)){ // 로그인 안했으면 손님
			userID = "custom";
		}
		
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<Basket> list = new ArrayList<>();
		
		String sql = "SELECT * FROM basket WHERE basUserID='" + userID + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while (rs.next()) {
			Basket item = new Basket();
			item.setBasItemNum(rs.getString(1));
			item.setBasItemName(rs.getString(2));
			item.setBasItemPrice(rs.getString(3));
			item.setBasUserID(rs.getString(4));
			list.add(item);
		}
		
		request.setAttribute("basket", list);
		
		// 총합금 계산
		sql = "SELECT SUM(basItemPrice) AS total FROM basket WHERE basUserID='" + userID + "'";

		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		rs.next();
		String total = rs.getString("total");
		
		request.setAttribute("total", total);
		// 총합금 계산 끝
		
		rs.close();
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("basketListStart.jsp");
		rd.forward(request, response);
	%>
</body>
</html>