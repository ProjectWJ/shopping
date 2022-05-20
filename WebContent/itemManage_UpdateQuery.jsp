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
		request.setCharacterEncoding("utf-8"); // 카테고리, 상품명, 가격, 재고, 요약정보만 수정
		
		String itemPrice_p = (request.getParameter("itemPrice")).replace(",", ""); // , 제거 작업
		String itemNum = request.getParameter("itemNum");
		String itemName_o = request.getParameter("itemName_o"); // itemInfo 변경용
		
		// update할 데이터 정리
		String itemCategory = request.getParameter("itemCategory");
		String itemName = request.getParameter("itemName");
		int itemPrice = Integer.parseInt(itemPrice_p);
		int itemVolume = Integer.parseInt(request.getParameter("itemVolume"));
		String itemInformation = request.getParameter("itemInformation");
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update item set itemCategory=?, itemName=?, itemPrice=?, itemVolume=?, itemInformation=? where itemNum=?; update iteminfo set itemName=? where itemName=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, itemCategory);
		pstmt.setString(2, itemName);
		pstmt.setInt(3, itemPrice);
		pstmt.setInt(4, itemVolume);
		pstmt.setString(5, itemInformation);
		pstmt.setString(6, itemNum);
		
		pstmt.setString(7, itemName);
		pstmt.setString(8, itemName_o);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("result", result);
		
		pstmt.close();
		conn.close();
	%>
<jsp:forward page="itemManage_UpdateResult.jsp"></jsp:forward>
</body>
</html>