<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itemInfo.ItemInfo" %>  
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %>
	<%
		Statement stat = null;
		ResultSet rs = null;
		String itemName = request.getParameter("itemName");
		
		String sql = "select * from itemInfo where itemName='" + itemName + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		if (rs.next()) {
			request.setAttribute("itemName", rs.getString("itemName"));
			request.setAttribute("itemInfoProcesser", rs.getString("itemInfoProcesser"));
			request.setAttribute("itemInfoMemory", rs.getString("itemInfoMemory"));
			request.setAttribute("itemInfoDisplay", rs.getString("itemInfoDisplay"));
			request.setAttribute("itemInfoNetwork", rs.getString("itemInfoNetwork"));
			request.setAttribute("itemInfoWiFi", rs.getString("itemInfoWiFi"));
			request.setAttribute("itemInfoCamera", rs.getString("itemInfoCamera"));
			request.setAttribute("itemInfoBattery", rs.getString("itemInfoBattery"));
			request.setAttribute("itemInfoOperate", rs.getString("itemInfoOperate"));
			request.setAttribute("itemInfoSize", rs.getString("itemInfoSize"));
			request.setAttribute("itemInfoUSB", rs.getString("itemInfoUSB"));
			request.setAttribute("itemInfoSecure", rs.getString("itemInfoSecure"));
			request.setAttribute("itemInfoAnother", rs.getString("itemInfoAnother"));
		}
		
		rs.close(); 
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("itemManage_DetailUpdateForm.jsp");
		rd.forward(request, response);
	%>
</body>
</html>