<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자급자폰</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %> <!-- itemManage에서 상품명 클릭 시 실행되는 쿼리. 수정하기 위해 데이터를 불러오는 작업 -->
	<%
		request.setCharacterEncoding("utf-8");
		String itemNum = request.getParameter("itemNum");
	
		Statement stat = null;
		ResultSet rs = null;
		
		String sql = "select * from item where itemNum='" + itemNum + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		int result = 0;
		
		if (rs.next()) {
			result = 1;
			request.setAttribute("itemNum", rs.getString("itemNum"));
			request.setAttribute("itemCategory", rs.getString("itemCategory"));
			request.setAttribute("itemName", rs.getString("itemName"));
			request.setAttribute("itemPrice", rs.getInt("itemPrice")); // String해도 상관없다?
			request.setAttribute("itemVolume", rs.getInt("itemVolume")); //
			request.setAttribute("itemInformation", rs.getString("itemInformation"));
			request.setAttribute("itemDate", rs.getString("itemDate"));
			request.setAttribute("itemImage", rs.getString("itemImage"));
			request.setAttribute("itemImageDetail", rs.getString("itemImageDetail"));
		}
		
		request.setAttribute("result", result);
		
		rs.close(); 
		stat.close();
		conn.close();
	%>
	<jsp:forward page="itemManage_UpdateForm.jsp"></jsp:forward>
</body>
</html>