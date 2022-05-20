<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자급자폰</title>
</head>
<body>
	<%@ include file="memberDB.jsp" %> <!-- memberManage에서 회원번호 클릭 시 실행되는 쿼리. 수정하기 위해 데이터를 불러오는 작업 -->
	<%
		request.setCharacterEncoding("utf-8");
		String userNum = request.getParameter("userNum");
	
		Statement stat = null;
		ResultSet rs = null;
		
		String sql = "select * from user where userNum='" + userNum + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		int result = 0;
		
		if (rs.next()) {
			result = 1;
			request.setAttribute("userNum", rs.getString("userNum"));
			request.setAttribute("userID", rs.getString("userID"));
			request.setAttribute("userPassword", rs.getString("userPassword"));
			request.setAttribute("userName", rs.getString("userName"));
			request.setAttribute("userAddress", rs.getString("userAddress"));
			request.setAttribute("userPhone", rs.getString("userPhone"));
			request.setAttribute("userGrade", rs.getString("userGrade"));
		}
		
		request.setAttribute("result", result);
		
		rs.close(); 
		stat.close();
		conn.close();
	%>
	<jsp:forward page="memberManage_UpdateForm.jsp"></jsp:forward>
</body>
</html>