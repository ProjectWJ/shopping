<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %> <!-- userID의 값을 받아 회원탈퇴 처리 -->
	<%
		String basItemNum = request.getParameter("basItemNum");
		String userID = request.getParameter("userID");	
	
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from basket where basItemNum=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, basItemNum);
		
		result = pstmt.executeUpdate();
		
		request.setAttribute("userID", userID);
		request.setAttribute("result", result);
		
		pstmt.close();
		conn.close();
	%>
	<jsp:forward page="basketDeleteResult.jsp"></jsp:forward>
</body>
</html>