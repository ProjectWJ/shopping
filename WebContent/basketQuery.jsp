<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="memberDB.jsp" %>
	<%
		request.setCharacterEncoding("utf-8"); // 장바구니
		String itemNum = request.getParameter("itemNum");
		String userID = request.getParameter("userID");
		
		if(userID.equals(null)){
			userID = "custom";
		}
		
		PreparedStatement pstmt = null;
		Statement stat = null;
		ResultSet rs = null;
		int result = 0;

		String sql = "SELECT count(basItemNum) as c1 FROM basket WHERE basitemNum='" + itemNum + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		rs.next();
		int count = Integer.parseInt(rs.getString("c1"));
		
		if (count == 0){
			sql = "INSERT INTO basket (basItemNum, basItemName, basItemPrice, basUserID) SELECT itemNum, itemName, itemPrice, ? FROM item WHERE itemNum=?"; // 상품번호로 item에서 검색 후 basket에 저장
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, itemNum);
			
			result = pstmt.executeUpdate();
			request.setAttribute("result", result);
			pstmt.close();
		} else{
			result = 0;
			request.setAttribute("result", result);
		}

		rs.close();
		stat.close();
		conn.close();
	%>
	<jsp:forward page="basketResult.jsp"></jsp:forward>
</body>
</html>