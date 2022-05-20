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
		// update할 데이터 정리
		request.setCharacterEncoding("utf-8"); // 비밀번호, 이름, 주소, 휴대폰번호만 업데이트
		String userNum = request.getParameter("userNum");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		String userAddress = request.getParameter("userAddress");
		String userPhone = request.getParameter("userPhone");
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "update user set userPassword=?, userName=?, userAddress=?, userPhone=? where userNum=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userPassword);
		pstmt.setString(2, userName);
		pstmt.setString(3, userAddress);
		pstmt.setString(4, userPhone);
		pstmt.setString(5, userNum);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("result", result);
		
		pstmt.close();
		conn.close();
	%>
<jsp:forward page="memberManage_UpdateResult.jsp"></jsp:forward>
</body>
</html>