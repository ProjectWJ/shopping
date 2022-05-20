<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
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

		String itemName = request.getParameter("itemName");
		String itemInfoProcesser = request.getParameter("itemInfoProcesser");
		String itemInfoMemory = request.getParameter("itemInfoMemory");
		String itemInfoDisplay = request.getParameter("itemInfoDisplay");
		String itemInfoNetwork = request.getParameter("itemInfoNetwork");
		String itemInfoWiFi = request.getParameter("itemInfoWiFi");
		String itemInfoCamera = request.getParameter("itemInfoCamera");
		String itemInfoBattery = request.getParameter("itemInfoBattery");
		String itemInfoOperate = request.getParameter("itemInfoOperate");
		String itemInfoSize = request.getParameter("itemInfoSize");
		String itemInfoUSB = request.getParameter("itemInfoUSB");
		String itemInfoSecure = request.getParameter("itemInfoSecure");
		String itemInfoAnother = request.getParameter("itemInfoAnother");
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update itemInfo set itemName=?, itemInfoProcesser=?, itemInfoMemory=?, itemInfoDisplay=?, itemInfoNetwork=?, itemInfoWiFi=?, itemInfoCamera=?, itemInfoBattery=?, itemInfoOperate=?, itemInfoSize=?, itemInfoUSB=?, itemInfoSecure=?, itemInfoAnother=? where itemName=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, itemName);
		pstmt.setString(2, itemInfoProcesser);
		pstmt.setString(3, itemInfoMemory);
		pstmt.setString(4, itemInfoDisplay);
		pstmt.setString(5, itemInfoNetwork);
		pstmt.setString(6, itemInfoWiFi);
		pstmt.setString(7, itemInfoCamera);
		pstmt.setString(8, itemInfoBattery);
		pstmt.setString(9, itemInfoOperate);
		pstmt.setString(10, itemInfoSize);
		pstmt.setString(11, itemInfoUSB);
		pstmt.setString(12, itemInfoSecure);
		pstmt.setString(13, itemInfoAnother);
		pstmt.setString(14, itemName);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("result", result);
		
		pstmt.close();
		conn.close();
	%>
<jsp:forward page="itemManage_DetailUpdateResult.jsp"></jsp:forward>
</body>
</html>