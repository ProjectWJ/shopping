<%@ page import="item.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="itemDB.jsp" %> <!-- itemNum 생성 -->
	<%
		request.setCharacterEncoding("utf-8");
		String itemCategory = request.getParameter("itemCategory"); // 카테고리를 받아 로딩
		
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<Item> list = new ArrayList<>(); // Item 객체 형태로 arraylist에 저장
		
		String sql = "select itemName from iteminfo";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while (rs.next()) {
			Item item = new Item();
			item.setItemName(rs.getString(1));
			list.add(item);
		}
		
		request.setAttribute("list", list);
		
		rs.close();
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("CompareStart.jsp");
		rd.forward(request, response);
	%>
</body>
</html>