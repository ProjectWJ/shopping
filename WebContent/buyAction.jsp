<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
		// insert할 데이터 정리
		request.setCharacterEncoding("utf-8"); // 영수증 만들기
		
		// buyForm에서 생성한 영수증번호 받기
		String recNum = request.getParameter("recNum");
	
		// 구매일 생성
		Date nowTime = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String recDate = simpleDateFormat.format(nowTime);
		
		// 구매자 정보
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userAddress = request.getParameter("userAddress");
		
		// 구매상품 정보는 sql로 처리
		PreparedStatement pstmt = null;
		int result = 0;
		
		// 영수증 생성
		String sql = "INSERT INTO receipt SELECT '" + recNum + "', '" + recDate + "', '" + userName + "', '" + userPhone + "', '" + userAddress + "', basItemName, basItemPrice FROM basket GROUP BY basItemName"; 
		
		pstmt = conn.prepareStatement(sql);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("recNum", recNum); // 주문번호 전달
		request.setAttribute("result", result);
		
		
		// 구매 후 장바구니 초기화
		sql = "truncate basket";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();

		
		pstmt.close();
		conn.close();
	%>
<jsp:forward page="buyResult.jsp"></jsp:forward>
</body>
</html>