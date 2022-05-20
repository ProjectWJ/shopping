<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="memberDB.jsp" %> <!-- userID의 값을 받아 회원탈퇴 처리 -->
	<%
		String userID = request.getParameter("userID");
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from user where userID=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("result", result);
		
		pstmt.close();
		conn.close();
	%>
	<jsp:forward page="memberManage_DeleteResult.jsp"></jsp:forward>
</body>
</html>