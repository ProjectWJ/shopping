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
		String itemNum = request.getParameter("itemNum");
		String userID = request.getParameter("userID");
		
		Statement stat = null;
		ResultSet rs = null;
		
		if (userID == null){
			userID = "custom";
		}
		
		String sql = "SELECT itemName, itemPrice from item where itemNum='" + itemNum + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);

		if (rs.next()) {
			request.setAttribute("itemName", rs.getString("itemName"));
			request.setAttribute("itemPrice", rs.getString("itemPrice"));
		}
		
		request.setAttribute("userID", userID);
		
		rs.close();
		stat.close();
		conn.close();
		
	%>
	<jsp:forward page="buy_OneForm.jsp"></jsp:forward>
</body>
</html>