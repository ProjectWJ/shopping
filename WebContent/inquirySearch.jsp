<%@ page import="receipt.Receipt" %>
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
		String recNum = request.getParameter("recNum"); // 왼쪽 휴대폰
		
		Statement stat = null;
		ResultSet rs = null;
		
		ArrayList<Receipt> rec = new ArrayList<>();
		
		String sql = "SELECT distinct recNum, recDate, userName, userPhone, userAddress FROM receipt WHERE recNum='" + recNum + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		if (rs.next()) {
			request.setAttribute("recNum", rs.getString("recNum"));
			request.setAttribute("recDate", rs.getString("recDate"));
			request.setAttribute("userName", rs.getString("userName"));
			request.setAttribute("userPhone", rs.getString("userPhone"));
			request.setAttribute("userAddress", rs.getString("userAddress"));
		}
		
		
		sql = "SELECT recItem, recPrice FROM receipt WHERE recNum='" + recNum + "'";
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		try{
			while (rs.next()) {
				Receipt p = new Receipt();
				p.setRecItem(rs.getString(1));
				p.setRecPrice(rs.getString(2));
				rec.add(p);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		request.setAttribute("rec", rec);
		
		rs.close();
		stat.close();
		conn.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("inquiry.jsp");
		rd.forward(request, response);
	%>
</body>
</html>